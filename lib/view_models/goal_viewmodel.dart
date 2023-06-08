import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/goal_model.dart';

/// Manages the goals in the training program.
///
/// The GoalViewModel class is responsible for handling the CRUD operations related to goals.
/// It interacts with the Firestore database to store and retrieve goal data for the current user.
/// The class provides methods to add a new goal, update goal details (weight and date), and save
/// the goals to the database. It also includes a method to fetch the goals from the database and
/// update the local _goals list accordingly.
///
/// Authors: Jackie
class GoalViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('goals');
  bool isLoading = false;
  List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  @override
  void onInit() {
    print('INIT Goal viewmodel');
    super.onInit();
  }

  /// Adds a new goal workout with default values.
  ///
  /// This method creates a new Goal instance with the provided workout name
  /// and default values for prWeight, goalWeight, and goalDate. The new
  /// goal is then added to the _goals list and triggers an update to refresh
  /// the UI.
  ///
  /// Authors: Jackie
  void addGoalWorkout(String workout) {
    _goals.add(Goal(
        workout: workout,
        prWeight: '',
        goalWeight: '',
        goalDate: _addSixMonths()));
    update();
  }

  /// Updates the goal weight for a specific goal.
  ///
  /// This method updates the goalWeight property of the goal at the specified
  /// index in the _goals list. It allows the user to set a new target weight
  /// for the goal and triggers an update to reflect the changes in the UI.
  ///
  /// Authors: Jackie
  void updateGoalWeight(String goalWeight, int index) {
    _goals[index].goalWeight = goalWeight;
  }

  /// Updates the personal record weight for a specific workout.
  ///
  /// This method retrieves the workout data from the Firestore database using
  /// the workout name. It iterates over the retrieved data and extracts the
  /// weight values from the workouts. The highest weight value is then assigned
  /// as the prWeight property for the corresponding goal at the specified index.
  /// If index is -1, no goal is updated. Finally, it triggers an update to reflect
  /// the changes in the UI.
  ///
  /// Authors: Jackie
  Future<void> updatePrWeight(String workout, int index) async {
    final dbRefTrain = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('trainings');

    List<dynamic> workoutsList = [];

    await dbRefTrain.get().then((QuerySnapshot querySnapshot) async {
      await Future.wait(
          querySnapshot.docs.map((DocumentSnapshot document) async {
        DocumentReference docRef = document.reference;
        DocumentSnapshot docSnapshot =
            await docRef.collection('sets').doc(workout).get();

        if (docSnapshot.exists) {
          dynamic value = docSnapshot.data();
          if (value != null) {
            print(value['workouts']);
            List<dynamic> temp = value['workouts'] as List<dynamic>;
            workoutsList.addAll(temp);
          }
        }
      }));
    }).catchError((error) {
      print('fejl: $error');
    });

    print('DONE');
    print(workoutsList);
    print(_findHighestValue(workoutsList));
    if (index != -1) {
      _goals[index].prWeight = _findHighestValue(workoutsList).toString();
    }
    update();
  }

  /// Updates the goal date for a specific goal.
  ///
  /// This method updates the goalDate property of the goal at the specified
  /// index in the _goals list. It allows the user to set a new target date
  /// for the goal and triggers an update to reflect the changes in the UI.
  ///
  /// Authors: Jackie
  void updateGoalDate(DateTime date, int index) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    _goals[index].goalDate = formattedDate;
    update();
  }

  /// Saves the goals to the Firestore database.
  ///
  /// This method saves the _goals list to the Firestore database for the
  /// current user. It converts each Goal object into a Map<String, dynamic>
  /// and creates a list of goals data. The goals data is then stored under the
  /// 'goals' field in the document corresponding to the current user. Upon
  /// successful completion, it prints a success message. If an error occurs,
  /// it prints an error message.
  ///
  /// Authors: Jackie
  void saveGoals() {
    final DocumentReference documentRef =
        _dbRef.doc(FirebaseAuth.instance.currentUser?.uid);

    List<Map<String, dynamic>> goalsData = goals.map((goal) {
      return {
        'workout': goal.workout,
        'goalDate': goal.goalDate,
        'prWeight': goal.prWeight,
        'goalWeight': goal.goalWeight,
      };
    }).toList();

    Map<String, dynamic> data = {
      'goals': goalsData,
    };

    documentRef.set(data).then((value) {
      print('Mål er gemt.');
    }).catchError((error) {
      print('Fejl under gemning af mål: $error');
    });
  }

  /// Fetches the goals from the Firestore database.
  ///
  /// This method retrieves the goals data from the Firestore database for the
  /// current user. It clears the _goals list and triggers an update to reflect
  /// the changes in the UI. Then, it retrieves the goals data from the database
  /// and populates the local _goals list with the fetched goals. For each goal,
  /// it also calls the updatePrWeight method to update the personal record weight.
  ///
  /// Authors: Jackie
  Future<void> getGoals() async {
    isLoading = true;
    _goals = [];
    update();
    print('Henter goals');
    final DocumentReference documentRef =
        _dbRef.doc(FirebaseAuth.instance.currentUser?.uid);

    DocumentSnapshot docSnapshot = await documentRef.get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      dynamic goalsData = docSnapshot.data();

      goalsData['goals'].forEach((data) async {
        String workout = data['workout'];
        String goalDate = data['goalDate'];
        String prWeight = data['prWeight'];
        String goalWeight = data['goalWeight'];

        Goal goal = Goal(
            workout: workout,
            prWeight: prWeight,
            goalWeight: goalWeight,
            goalDate: goalDate);
        _goals.add(goal);
        await updatePrWeight(goal.workout, _goals.length - 1);
      });

      print(goalsData);
    }
    isLoading = false;
    update();
  }

  /// Finds the highest value in a list of dynamic values.
  ///
  /// This private method iterates over the values list and checks if each
  /// value is a string with two parts separated by a semicolon. If so, it
  /// extracts the first part (which is expected to be a number) and compares
  /// it to the current highest value. If the extracted value is higher, it
  /// updates the highestValue variable. Finally, it returns the highest value.
  ///
  /// Authors: Jackie
  int _findHighestValue(List<dynamic> values) {
    int highestValue = 0;

    for (dynamic value in values) {
      if (value is String) {
        List<String> parts = value.split(";");
        if (parts.length == 2) {
          int currentValue = int.tryParse(parts[0]) ?? 0;
          if (currentValue > highestValue) {
            highestValue = currentValue;
          }
        }
      }
    }

    return highestValue;
  }

  /// Adds six months to the current date.
  ///
  /// This private method calculates the date that is six months ahead of the
  /// current date. It uses the DateTime.now() method to get the current date,
  /// then creates a new DateTime object by adding six months to the current month.
  /// Finally, it formats the resulting date as a string with the format 'dd-MM-yyyy'
  /// and returns it.
  ///
  /// Authors: Jackie
  String _addSixMonths() {
    DateTime now = DateTime.now();
    DateTime futureDate = DateTime(now.year, now.month + 6, now.day);
    String date = DateFormat('dd-MM-yyyy').format(futureDate);

    return date;
  }
}

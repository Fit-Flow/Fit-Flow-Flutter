import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/goal_model.dart';

class GoalViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('goals');
  bool isLoading = false;
  List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  void addGoalWorkout(String workout) {
    _goals.add(Goal(workout: workout, prWeight: '', goalWeight: ''));
    update();
  }

  void updateGoalWeight(String goalWeight, int index) {
    _goals[index].goalWeight = goalWeight;
  }

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

  void saveGoals() {
    final DocumentReference documentRef =
        _dbRef.doc(FirebaseAuth.instance.currentUser?.uid);

    List<Map<String, dynamic>> goalsData = goals.map((goal) {
      return {
        'workout': goal.workout,
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
        String prWeight = data['prWeight'];
        String goalWeight = data['goalWeight'];

        Goal goal =
            Goal(workout: workout, prWeight: prWeight, goalWeight: goalWeight);
        _goals.add(goal);
        await updatePrWeight(goal.workout, _goals.length - 1);
      });

      print(goalsData);
    }
    isLoading = false;
    update();
  }

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
}

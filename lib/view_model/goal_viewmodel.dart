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

  void updatePrWeight(String workout, int index) async {
    final dbRefTrain = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('trainings');

    List<dynamic> workoutsList = [];

    await dbRefTrain.get().then((QuerySnapshot querySnapshot) async {
      await Future.wait(
          querySnapshot.docs.map((DocumentSnapshot document) async {
        // Hent dokumentets reference
        DocumentReference docRef = document.reference;

        // Hent dokumentet
        DocumentSnapshot docSnapshot =
            await docRef.collection('sets').doc(workout).get();

        if (docSnapshot.exists) {
          // Hent listen 'workouts'
          dynamic value = docSnapshot.data();

          // Udfør handling baseret på værdien
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
    _goals[index].prWeight = _findHighestValue(workoutsList).toString();
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

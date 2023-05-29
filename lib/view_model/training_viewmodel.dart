import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/models/training_model.dart';
import 'package:fit_flow_flutter/models/workout_set_model.dart';
import 'package:fit_flow_flutter/utils/components/dialogs/snackbar_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/workout_model.dart';

/// The [TrainingViewModel] class handles the management of workouts and workout sets in a training session.
///
/// This class extends [GetxController] and implements the [GetxService] interface.
/// It provides methods for updating workout names, adding workouts and sets, removing workouts and sets.
class TrainingViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('trainings');
  Training _currentTraining = Training(
      name: 'Træning ${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
      workouts: [],
      timestamp: Timestamp.fromDate(DateTime.now()));

  Training get currentTraining => _currentTraining;

  /// Updates the name of the workout at the specified index.
  ///
  /// The workout's name is updated with the provided [name], and the UI is updated.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void updateWorkoutName(String name, int index) {
    _currentTraining.workouts[index].name = name;
    update();
  }

  /// Adds a new workout to the training session.
  ///
  /// The provided [workout] is added to the list of workouts, and the UI is updated.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void addWorkout(Workout workout) {
    _currentTraining.workouts.add(workout);
    update();
  }

  /// Adds a new set to the workout at the specified index.
  ///
  /// A new [WorkoutSet] object with initial kilo and reps values is added to the workout's list of sets,
  /// and the UI is updated.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void addSetToTraining(int index) {
    _currentTraining.workouts[index].workoutSets
        .add(WorkoutSet(kilo: 0, reps: 0));
    update();
  }

  /// Removes the workout at the specified index from the training session.
  ///
  /// The workout is removed from the list of workouts, and the UI is updated.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void removeWorkout(int index) {
    _currentTraining.workouts.removeAt(index);
    update();
  }

  /// Removes the set at the specified index from the workout at the specified workout index.
  ///
  /// The set is removed from the workout's list of sets, and the UI is updated.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void removeSetFromTraining(int workoutIndex, int setIndex) {
    _currentTraining.workouts[workoutIndex].workoutSets.removeAt(setIndex);
    update();
  }

  /// Adds the number of reps to a specific workout set in the current training.
  ///
  /// The [workoutIndex] specifies the index of the workout in the current training.
  /// The [setIndex] specifies the index of the workout set in the specified workout.
  /// The [reps] is the number of reps to be added.
  ///
  /// authors: Jackie & Christoffer
  void addReps(int workoutIndex, int setIndex, int reps) {
    _currentTraining.workouts[workoutIndex].workoutSets[setIndex].reps = reps;
  }

  /// Adds the weight to a specific workout set in the current training.
  ///
  /// The [workoutIndex] specifies the index of the workout in the current training.
  /// The [setIndex] specifies the index of the workout set in the specified workout.
  /// The [weight] is the weight to be added.
  ///
  /// authors: Jackie & Christoffer
  void addWeight(int workoutIndex, int setIndex, int weight) {
    _currentTraining.workouts[workoutIndex].workoutSets[setIndex].kilo = weight;
  }

  /// Saves the current training to the database.
  ///
  /// It creates a new document in the database with the name and timestamp of the current training.
  /// Then, it iterates through each workout in the current training and saves their respective sets to the database.
  ///
  /// authors: Jackie & Christoffer
  void saveTraining() {
    final training = <String, dynamic>{
      "name": _currentTraining.name,
      "timestamp": _currentTraining.timestamp
    };
// TODO: HVIS MAN OPRETTER 2 PÅ SAMME DAG, SÅ SKAL NAVNET ÆNDRES!
    _dbRef
        .doc(_currentTraining.name)
        .set(training)
        .onError((e, _) => print("Error writing document: $e"))
        .then((value) {
      _currentTraining.workouts.forEach((workout) {
        List<String> workoutSets = [];
        workout.workoutSets.forEach((element) {
          String temp = element.kilo.toString() + ";" + element.reps.toString();
          workoutSets.add(temp);
        });

        final workoutMap = <String, dynamic>{
          "name": workout.name,
          "workouts": workoutSets,
        };

        _dbRef
            .doc(_currentTraining.name)
            .collection('sets')
            .doc(workout.name)
            .set(workoutMap);
      });
    }).then((value) {
      buildSuccessSnackBar("Gemt", "Træning er gemt");
      //TODO: Slet alt og lav en ny træning
    });
  }
}

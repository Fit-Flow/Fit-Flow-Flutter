import 'package:fit_flow_flutter/models/training_model.dart';
import 'package:fit_flow_flutter/models/workout_set_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/workout_model.dart';

/// The [TrainingViewModel] class handles the management of workouts and workout sets in a training session.
///
/// This class extends [GetxController] and implements the [GetxService] interface.
/// It provides methods for updating workout names, adding workouts and sets, removing workouts and sets.
class TrainingViewModel extends GetxController implements GetxService {
  Training _currentTraining = Training(
      name: 'Træning ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
      workouts: []);

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
}

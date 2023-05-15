import 'package:fit_flow_flutter/models/workout_set_model.dart';
import 'package:get/get.dart';

import '../models/workout_model.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class TrainingViewModel extends GetxController implements GetxService {
  List<Workout> _workouts = [];
  List<Workout> get workouts => _workouts;

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    update();
  }

  void addSetToTraining(int index) {
    _workouts[index].workoutSets.add(WorkoutSet(kilo: 0, reps: 0));
    update();
  }

  void removeWorkout(int index) {
    _workouts.removeAt(index);
    update();
  }

  void removeSetFromTraining(int index, int index2) {
    print('$index = index // $index2 = index2');
    _workouts[index].workoutSets.removeAt(index2);
    update();
  }
}

import 'package:fit_flow_flutter/models/workout_set_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/workout_model.dart';
import '../utils/components/training_widget.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class TrainingViewModel extends GetxController implements GetxService {

  List<List<Widget>> _sets = [[]]; //Liste af workouts med en Liste af sets
  List<List<Widget>> get sets => _sets;

  List<Workout> _workouts = [];
  List<Workout> get workouts => _workouts;

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    update();
  }

  void addSetToTraining(int index) {
    _workouts[index].workoutSets.add(WorkoutSet(kilo: 0, reps: 0));
    //_sets[index].add(TrainingSetWidget());
    update();
  }
}
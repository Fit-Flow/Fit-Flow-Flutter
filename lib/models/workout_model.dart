import 'package:fit_flow_flutter/models/workout_set_model.dart';

class Workout {
  String name;
  List<WorkoutSet> workoutSets;

  Workout({required this.name, required this.workoutSets});
}
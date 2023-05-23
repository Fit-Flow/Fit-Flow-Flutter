import 'package:fit_flow_flutter/models/workout_set_model.dart';

/// Represents a workout.
///
/// The [name] property represents the name of the workout.
/// The [workoutSets] property represents a list of workout sets within the workout.
///
/// authors: Jackie, Christoffer & Jakob
class Workout {
  String name;
  List<WorkoutSet> workoutSets;

  Workout({required this.name, required this.workoutSets});
}

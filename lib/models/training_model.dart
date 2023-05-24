import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_flow_flutter/models/workout_model.dart';

/// Represents a training session.
///
/// The [name] is the name of the training session.
/// The [timestamp] is the timestamp when the training session was created.
/// The [workouts] is the list of workouts included in the training session.
///
/// Authors: Jackie, Christoffer & Jakob
class Training {
  final String name;
  final Timestamp timestamp;
  final List<Workout> workouts;

  Training({
    required this.name,
    required this.timestamp,
    required this.workouts,
  });
}

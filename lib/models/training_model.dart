import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_flow_flutter/models/workout_model.dart';

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

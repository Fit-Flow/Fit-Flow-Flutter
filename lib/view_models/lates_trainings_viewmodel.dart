import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/models/workout_model.dart';
import 'package:fit_flow_flutter/models/workout_set_model.dart';
import 'package:get/get.dart';

import '../models/training_model.dart';

class LatestTrainingViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('trainings');

  List<Training> _trainings = [];
  List<Training> get trainings => _trainings;
  RxBool trainingLoaded = false.obs;

  Future<void> fetchTrainingsFromFirestore() async {
    List<Training> trainings = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _dbRef.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String name = doc.data()['name'];
        Timestamp timestamp = doc.data()['timestamp'];
        List<Workout> sets =
            await fetchSetsFromFirestore(doc.reference.collection('sets'));

        Training training =
            Training(name: name, timestamp: timestamp, workouts: sets);
        trainings.add(training);
      }
    } catch (e) {
      print('Error fetching trainings: $e');
      trainingLoaded.value = false;
    }
    _trainings = trainings;
    if (_trainings.isNotEmpty) {
      trainingLoaded.value = true;
    }
  }

  Future<List<Workout>> fetchSetsFromFirestore(
      CollectionReference<Map<String, dynamic>> collectionRef) async {
    List<Workout> sets = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await collectionRef.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String name = doc.data()['name'];
        List<WorkoutSet> workouts = (doc.data()['workouts'] as List<dynamic>)
            .map((w) => WorkoutSet(kilo: 0, reps: 0)) //TODO: tilføj værdier
            .toList();

        Workout set = Workout(name: name, workoutSets: workouts);
        sets.add(set);
      }
    } catch (e) {
      print('Error fetching sets: $e');
    }

    return sets;
  }
}

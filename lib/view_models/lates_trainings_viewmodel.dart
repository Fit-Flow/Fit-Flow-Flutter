import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/models/workout_model.dart';
import 'package:fit_flow_flutter/models/workout_set_model.dart';
import 'package:get/get.dart';

import '../models/training_model.dart';

/// A view model class that handles fetching and managing latest trainings from Firestore.
///
/// This class extends [GetxController] and implements [GetxService] to enable reactive programming
/// and dependency injection using the GetX package.
///
/// It provides a method to fetch trainings from Firestore and populates the `_trainings` list.
/// The fetched trainings are stored in the `_trainings` list and the `trainingLoaded` flag is set to indicate the loading status.
///
/// Author: Jackie
class LatestTrainingViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('trainings');

  List<Training> _trainings = [];
  List<Training> get trainings => _trainings;
  RxBool trainingLoaded = false.obs;

  /// Fetches trainings from Firestore and populates the `_trainings` list.
  /// Each training document in Firestore should have a 'name' and 'timestamp' field,
  /// as well as a subcollection named 'sets' containing documents with a 'name' field
  /// and a list of workouts.
  ///
  /// Throws an error and sets `trainingLoaded` to `false` if an error occurs while fetching trainings.
  ///
  /// On successful fetching, sets the fetched trainings to the `_trainings` list and sets `trainingLoaded` to `true`.
  ///
  /// Author: Jackie
  Future<void> fetchTrainingsFromFirestore() async {
    List<Training> trainings = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _dbRef.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String name = doc.data()['name'];
        Timestamp timestamp = doc.data()['timestamp'];
        List<Workout> sets =
            await _fetchSetsFromFirestore(doc.reference.collection('sets'));

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

  /// Fetches workout sets from a Firestore collection.
  ///
  /// Parameters:
  /// - [collectionRef]: The reference to the Firestore collection containing workout sets.
  ///
  /// Returns a list of [Workout] objects representing the fetched workout sets.
  ///
  /// Author: Jackie
  Future<List<Workout>> _fetchSetsFromFirestore(
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

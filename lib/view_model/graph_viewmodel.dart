import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/goal_model.dart';

class GraphViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('goals');
  Goal? goalOne = null;
  Goal? goalTwo = null;
  Goal? goalThree = null;

  void getGoalFromName(String name, int goalNumber) async {
    final DocumentReference documentRef =
        _dbRef.doc(FirebaseAuth.instance.currentUser?.uid);

    DocumentSnapshot docSnapshot = await documentRef.get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      dynamic goalsData = docSnapshot.data();

      goalsData['goals'].forEach((data) async {
        String workout = data['workout'];
        String goalDate = data['goalDate'];
        String prWeight = data['prWeight'];
        String goalWeight = data['goalWeight'];

        if (workout == name) {
          Goal goal = Goal(
              workout: workout,
              prWeight: prWeight,
              goalWeight: goalWeight,
              goalDate: goalDate);
          switch (goalNumber) {
            case 1:
              goalOne = goal;
              break;
            case 2:
              goalTwo = goal;
              break;
            case 3:
              goalThree = goal;
              break;
          }
          update();
        }
      });
    }
  }
}

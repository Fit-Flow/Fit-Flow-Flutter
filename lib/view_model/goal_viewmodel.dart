import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/goal_model.dart';

class GoalViewModel extends GetxController implements GetxService {
  final _dbRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('goals');
  bool isLoading = false;
  List<Goal> goals = [];
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow_flutter/view_model/authentication_viewmodel.dart';
import 'package:fit_flow_flutter/view_model/drawer_navigation_viewmodel.dart';
import 'package:fit_flow_flutter/view_model/training_viewmodel.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Firebase
  FirebaseAuth.instanceFor(app: Firebase.app());

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      Get.offNamed('/');
    } else {
      Get.offNamed('/dashboard');
      print('User is signed in!');
    }
  });

  //Repo
  //Get.lazyPut(() => SettingsRepo(sharedPreferences: sharedPreferences, apiClient: Get.find()));

  //View model
  Get.lazyPut(() => DrawerNavigationViewModel());
  Get.lazyPut(() => TrainingViewModel());
  Get.lazyPut(() => AuthenticationViewModel());
}

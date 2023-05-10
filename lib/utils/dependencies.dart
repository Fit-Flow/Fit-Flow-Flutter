import 'package:fit_flow_flutter/view_model/drawer_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Repo
  //Get.lazyPut(() => SettingsRepo(sharedPreferences: sharedPreferences, apiClient: Get.find()));

  //View model
  Get.lazyPut(() => DrawerNavigationViewModel());
}
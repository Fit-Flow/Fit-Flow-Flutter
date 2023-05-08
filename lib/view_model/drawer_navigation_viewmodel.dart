import 'package:fit_flow_flutter/view/dashboard/goal_page.dart';
import 'package:fit_flow_flutter/view/dashboard/settings_page.dart';
import 'package:fit_flow_flutter/view/dashboard/start_page.dart';
import 'package:fit_flow_flutter/view/dashboard/training_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerNavigationViewModel extends GetxController implements GetxService {
  Widget _selectedPage = StartPage();
  Widget get selectedPage => _selectedPage;

  void changePage(int index) {
    switch (index) {
      case 0:
        _selectedPage = StartPage();
        print("Start side");
        break;
      case 1:
        _selectedPage = TrainingPage();
        print("træning side");
        break;
      case 2:
        _selectedPage = GoalPage();
        print("mål side");
        break;
      case 3:
        _selectedPage = SettingsPage();
        print("settings side");
        break;
      default:
        _selectedPage = StartPage();
        print("Start side");
        break;
    }
  }
}

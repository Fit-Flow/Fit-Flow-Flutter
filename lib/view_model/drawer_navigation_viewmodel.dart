import 'package:fit_flow_flutter/view/dashboard/goal_page.dart';
import 'package:fit_flow_flutter/view/dashboard/settings_page.dart';
import 'package:fit_flow_flutter/view/dashboard/start_page.dart';
import 'package:fit_flow_flutter/view/dashboard/training_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The [DrawerNavigationViewModel] class handles the navigation between pages in the app's drawer navigation.
///
/// This class extends [GetxController] and implements the [GetxService] interface.
/// It provides methods for changing the selected page and keeps track of the current selected page index.
class DrawerNavigationViewModel extends GetxController implements GetxService {
  Widget _selectedPage = StartPage();
  Widget get selectedPage => _selectedPage;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  /// Changes the selected page based on the provided index.
  ///
  /// The index corresponds to the pages in the drawer navigation.
  /// When the page changes, the UI is updated.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void changePage(int index) {
    switch (index) {
      case 0:
        _selectedPage = StartPage();
        _selectedIndex = index;
        update();
        print("Start side");
        break;
      case 1:
        _selectedPage = TrainingPage();
        _selectedIndex = index;
        update();
        print("træning side");
        break;
      case 2:
        _selectedPage = GoalPage();
        _selectedIndex = index;
        update();
        print("mål side");
        break;
      case 3:
        _selectedPage = SettingsPage();
        _selectedIndex = index;
        update();
        print("settings side");
        break;
      default:
        _selectedPage = StartPage();
        _selectedIndex = 0;
        update();
        print("Start side");
        break;
    }
  }
}

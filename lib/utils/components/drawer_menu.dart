import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/view/dashboard/goal_page.dart';
import 'package:fit_flow_flutter/view/dashboard/settings_page.dart';
import 'package:fit_flow_flutter/view/dashboard/training_page.dart';
import 'package:fit_flow_flutter/view_model/drawer_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/dashboard/start_page.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.darkGreyColor,
      child: GetBuilder<DrawerNavigationViewModel> (builder: (drawerNav) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  drawerNav.changePage(0);
                },
                child: Container(
                  height: 120,
                  child: Image.asset('assets/img/FitFlowLogo.png'),
                ),
              ),
            ),
            SizedBox(height: 35,),
            DashboardIcon(
                isSelected: drawerNav.selectedIndex == 0,
                iconPath: "assets/icon/icon-home.png",
                onTap: () {
                  setState(() {
                    drawerNav.changePage(0);
                  });
                }),
            DashboardIcon(
                isSelected: drawerNav.selectedIndex == 1,
                iconPath: "assets/icon/icon-dumbbell.png",
                onTap: () {
                  setState(() {
                    drawerNav.changePage(1);
                  });
                }),
            DashboardIcon(
                isSelected: drawerNav.selectedIndex == 2,
                iconPath: "assets/icon/icon-goal.png",
                onTap: () {
                  setState(() {
                    drawerNav.changePage(2);
                  });
                }),
            DashboardIcon(
                isSelected: drawerNav.selectedIndex == 3,
                iconPath: "assets/icon/icon-settings.png",
                onTap: () {
                  setState(() {
                    drawerNav.changePage(3);
                  });
                }),
          ],
        );
      }),
    );
  }
}

class DashboardIcon extends StatelessWidget {
  final bool isSelected;
  final String iconPath;
  final VoidCallback onTap;

  DashboardIcon({
    Key? key,
    required this.isSelected,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            child: Image.asset(
              iconPath,
              height: 64,
              color:
                  isSelected ? AppColors.yellowColor : AppColors.lightGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}

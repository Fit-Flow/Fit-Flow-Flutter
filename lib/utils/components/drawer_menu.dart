import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool startSelected = true;

  bool trainingSelected = false;

  bool goalsSelected = false;

  bool settingsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.darkGreyColor,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              child: Image.asset('assets/img/FitFlowLogo.png'),
            ),
          ),
          SizedBox(height: 35,),
          DashboardIcon(
              isSelected: startSelected,
              iconPath: "assets/icon/icon-home.png",
              onTap: () {
                setState(() {
                  startSelected = !startSelected;
                  trainingSelected = false;
                  goalsSelected = false;
                  settingsSelected = false;
                });
              }),
          DashboardIcon(
              isSelected: trainingSelected,
              iconPath: "assets/icon/icon-dumbbell.png",
              onTap: () {
                setState(() {
                  trainingSelected = !trainingSelected;
                  startSelected = false;
                  goalsSelected = false;
                  settingsSelected = false;
                });
              }),
          DashboardIcon(
              isSelected: goalsSelected,
              iconPath: "assets/icon/icon-goal.png",
              onTap: () {
                setState(() {
                  goalsSelected = !goalsSelected;
                  trainingSelected = false;
                  startSelected = false;
                  settingsSelected = false;
                });
              }),
          DashboardIcon(
              isSelected: settingsSelected,
              iconPath: "assets/icon/icon-settings.png",
              onTap: () {
                setState(() {
                  settingsSelected = !settingsSelected;
                  trainingSelected = false;
                  goalsSelected = false;
                  startSelected = false;
                });
              }),
        ],
      ),
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

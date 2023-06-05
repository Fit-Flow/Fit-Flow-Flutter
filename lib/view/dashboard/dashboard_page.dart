import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/responsive.dart';
import 'package:fit_flow_flutter/view_model/drawer_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/buttons/rounded_icon_button.dart';
import '../../widgets/dashboard_content.dart';
import '../../widgets/dialogs/workout_dialog.dart';
import '../../widgets/drawer_menu.dart';

/// The [DashboardPage] class represents the dashboard page in the FitFlow app.
///
/// This page displays the main dashboard content, including the navigation drawer,
/// the workout content, and a floating action button for adding new exercises.
///
///authors: Jackie, Christoffer & Jakob
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      drawer: DrawerMenu(),
      floatingActionButton: GetBuilder<DrawerNavigationViewModel>(
        builder: (drawerNav) {
          return drawerNav.selectedIndex == 1
              ? RoundedIconButton(
                  onTap: () {
                    buildWorkoutDialog(-1);
                  },
                  icon: Icons.add,
                  color: AppColors.yellowIconColor,
                  tooltip: "Tilføj ny øvelse",
                )
              : Container();
        },
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: DrawerMenu(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: DashboardContent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

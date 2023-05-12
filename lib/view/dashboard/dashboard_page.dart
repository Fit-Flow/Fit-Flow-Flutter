import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/buttons/rounded_icon_button.dart';
import 'package:fit_flow_flutter/utils/responsive.dart';
import 'package:fit_flow_flutter/view_model/drawer_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/workout_model.dart';
import '../../utils/components/dashboard_content.dart';
import '../../utils/components/drawer_menu.dart';
import '../../view_model/training_viewmodel.dart';

/**
 * @authors Jackie, Chistoffer & Jakob
 */
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
                    Get.find<TrainingViewModel>()
                        .addWorkout(Workout(name: "Bænk", workoutSets: []));
                    Get.find<TrainingViewModel>().addSetToTraining(
                        Get.find<TrainingViewModel>().workouts.length - 1);
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

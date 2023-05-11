import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/components/header_widget.dart';
import '../../utils/components/search_field.dart';
import '../../utils/components/workout_field.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: "Træning",
            ),
            SizedBox(
              height: 15,
            ),
            WorkoutField(
              workout: 'Bænkpres',
              onTap: () {
                buildWorkoutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void buildWorkoutDialog() {
  Get.defaultDialog(
      title: "Find din øvelse",
      middleText: '',
      backgroundColor: AppColors.darkGreyColor,
      titleStyle: TextStyle(color: AppColors.textColor),
      radius: 30,
      content: Container(
        height: 600,
        width: 750,
        child: Column(children: [
          SearchField(),
        ]),
      ));
}

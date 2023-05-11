import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/components/header_widget.dart';
import '../../utils/components/search_field.dart';
import '../../utils/components/training_field.dart';
import '../../utils/components/workout_field.dart';
import '../../utils/components/workout_searchlist.dart';

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
            Row(
              children: [
                WorkoutField(
                  workout: 'Bænkpres',
                  onTap: () {
                    buildWorkoutDialog();
                  },
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        TrainingField(
                          hintText: 'Indtast din vægt',
                          prefixText: 'Vægt',
                          sufixText: 'Kg',
                        ),
                        TrainingField(
                          hintText: 'Indtast din reps',
                          prefixText: 'Reps',
                          sufixText: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
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
      titleStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      radius: 30,
      content: Container(
        height: 600,
        width: 750,
        child: Column(children: [
          SearchField(),
          WorkoutSearchList(workouts: [
            'Bænkpres',
            'Inclince Chest Press',
            'Tricpes Extension',
            'Bænkpres',
            'Inclince Chest Press',
            'Tricpes Extension',
            'Bænkpres',
            'Inclince Chest Press',
            'Tricpes Extension',
            'Bænkpres',
            'Inclince Chest Press',
            'Tricpes Extension',
            'Bænkpres',
            'Inclince Chest Press',
            'Tricpes Extension',
          ])
        ]),
      ));
}

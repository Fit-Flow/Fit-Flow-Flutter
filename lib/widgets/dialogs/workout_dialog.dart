import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../search_field.dart';
import '../workout_searchlist.dart';

/// Displays a dialog for finding a workout.
///
/// The [index] parameter is used for indicating the workout index.
///
/// Authors: Jackie, Christoffer & Jakob
void buildWorkoutDialog(int index) {
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
          WorkoutSearchList(
            workouts: [
              //TODO: Skal ændres til søgreresultater
              'Bænkpres',
              'Incline Chest Press',
              'Triceps Extension',
              'Squat',
              'Deadlift',
              'Lunges',
              'Shoulder Press',
              'Bicep Curls',
              'Pull-ups',
              'Push-ups',
              'Plank',
              'Russian Twists',
              'Leg Press',
              'Hamstring Curls',
              'Calf Raises',
            ],
            index: index,
          )
        ]),
      ));
}

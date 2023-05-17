import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';
import '../search_field.dart';
import '../workout_searchlist.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
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
            ],
            index: index,
          )
        ]),
      ));
}

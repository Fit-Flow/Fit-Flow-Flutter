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
            TrainingWidget()
          ],
        ),
      ),
    );
  }
}

class TrainingWidget extends StatefulWidget {
  TrainingWidget({
    super.key,
  });

  @override
  State<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends State<TrainingWidget> {
  List<Widget> sets = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        WorkoutField(
          workout: 'Bænkpres',
          onTap: () {
            buildWorkoutDialog();
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: List.generate(
                sets.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: sets[index],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  sets.add(TrainingSetWidget());
                });
              },
              elevation: 2.0,
              fillColor: AppColors.yellowIconColor,
              child: Icon(
                Icons.add,
                size: 45.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ],
        ),
      ],
    );
  }
}

class TrainingSetWidget extends StatelessWidget {
  const TrainingSetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
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

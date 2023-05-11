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

class WorkoutSearchList extends StatefulWidget {
  final List<String> workouts;
  const WorkoutSearchList({super.key, required this.workouts});

  @override
  State<WorkoutSearchList> createState() => _WorkoutSearchListState();
}

class _WorkoutSearchListState extends State<WorkoutSearchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520, //TODO: Gør den dynamisk
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              widget.workouts.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 55,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightGreyColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.workouts[index],
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}

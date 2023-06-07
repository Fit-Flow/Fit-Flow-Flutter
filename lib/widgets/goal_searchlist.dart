import 'package:fit_flow_flutter/view_models/goal_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

/// Constructs a `GoalSearchList` widget.
///
/// The [workouts] parameter is a list of workout names.
/// The [index] parameter represents the index of the workout being edited (-1 if a new workout is being added).
///
///authors: Jackie
class GoalSearchList extends StatefulWidget {
  final List<String> workouts;
  final int index;

  const GoalSearchList({Key? key, required this.workouts, required this.index})
      : super(key: key);

  @override
  State<GoalSearchList> createState() => _GoalSearchListState();
}

class _GoalSearchListState extends State<GoalSearchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520, //TODO: Make it dynamic
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            widget.workouts.length,
            (index) => Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Get.find<GoalViewModel>()
                        .addGoalWorkout(widget.workouts[index]);
                    Get.find<GoalViewModel>()
                        .updatePrWeight(widget.workouts[index], widget.index);
                    Get.back();
                  });
                },
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
                        style:
                            TextStyle(color: AppColors.textColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../app_colors.dart';

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

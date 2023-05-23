import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Constructs a `WorkoutField` widget.
///
/// The [workout] parameter represents the name of the workout.
/// The [onTap] parameter is a callback function that is triggered when the widget is tapped.
///
///authors: Jackie, Christoffer & Jakob
class WorkoutField extends StatelessWidget {
  final String workout;
  final VoidCallback onTap;

  const WorkoutField({Key? key, required this.workout, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 400,
        decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          border: Border.all(color: AppColors.lightGreyColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              workout,
              style: TextStyle(color: AppColors.textColor, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

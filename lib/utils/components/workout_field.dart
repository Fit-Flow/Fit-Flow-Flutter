import 'package:flutter/material.dart';

import '../app_colors.dart';

class WorkoutField extends StatelessWidget {
  final String workout;
  final VoidCallback onTap;
  const WorkoutField({super.key, required this.workout, required this.onTap});

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
            borderRadius: BorderRadius.circular(10)),
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

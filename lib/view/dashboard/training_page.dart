import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/components/header_widget.dart';

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
            WorkoutField(),
          ],
        ),
      ),
    );
  }
}

class WorkoutField extends StatelessWidget {
  const WorkoutField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          border: Border.all(color: AppColors.lightGreyColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

import 'package:fit_flow_flutter/utils/components/training_field.dart';
import 'package:fit_flow_flutter/utils/components/workout_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/training_viewmodel.dart';
import '../app_colors.dart';
import 'dialogs/workout_dialog.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class TrainingWidget extends StatefulWidget {
  TrainingWidget({
    super.key,
  });

  @override
  State<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends State<TrainingWidget> {

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
        GetBuilder<TrainingViewModel>(builder: (viewModel) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: List.generate(
                  viewModel.sets[0].length,
                      (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: viewModel.sets[0][index],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RawMaterialButton(
                onPressed: () {
                  viewModel.addSetToTraining(0);
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
          );
        }),
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
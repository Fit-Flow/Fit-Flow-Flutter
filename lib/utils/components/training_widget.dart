import 'package:fit_flow_flutter/utils/components/training_field.dart';
import 'package:fit_flow_flutter/utils/components/workout_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/workout_model.dart';
import '../../view_model/training_viewmodel.dart';
import '../app_colors.dart';
import 'buttons/rounded_icon_button.dart';
import 'dialogs/workout_dialog.dart';

class TrainingWidget extends StatefulWidget {
  final Workout workout;
  final int index;

  /// A widget that represents a training workout.
  ///
  /// The [workout] parameter represents the workout object.
  /// The [index] parameter is the index of the workout in the list.
  TrainingWidget({Key? key, required this.workout, required this.index})
      : super(key: key);

  @override
  State<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends State<TrainingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        children: [
          WorkoutField(
            workout: widget.workout.name,
            onTap: () {
              buildWorkoutDialog(widget.index);
            },
          ),
          GetBuilder<TrainingViewModel>(builder: (viewModel) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    widget.workout.workoutSets.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TrainingSetWidget(
                        isFirst: index == 0,
                        onAddTap: () {
                          viewModel.addSetToTraining(widget.index);
                        },
                        showAddButton:
                            index >= widget.workout.workoutSets.length - 1,
                        onRemoveTap: () {
                          if (index == 0) {
                            viewModel.removeWorkout(widget.index);
                          } else {
                            viewModel.removeSetFromTraining(
                                widget.index, index);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class TrainingSetWidget extends StatelessWidget {
  final VoidCallback onAddTap;
  final VoidCallback onRemoveTap;
  final bool showAddButton;
  final bool isFirst;

  /// A widget that represents a training set.
  ///
  /// The [onAddTap] callback is called when the add button is tapped.
  /// The [onRemoveTap] callback is called when the remove button is tapped.
  /// The [showAddButton] parameter determines whether the add button is visible.
  /// The [isFirst] parameter indicates whether this is the first training set.
  const TrainingSetWidget({
    Key? key,
    required this.onAddTap,
    required this.showAddButton,
    this.isFirst = false,
    required this.onRemoveTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        TrainingField(
          hintText: 'Indtast',
          prefixText: 'Vægt',
          suffixText: 'Kg',
        ),
        TrainingField(
          hintText: 'Indtast',
          prefixText: 'Reps',
          suffixText: '',
        ),
        if (showAddButton)
          RoundedIconButton(
            onTap: onAddTap,
            icon: Icons.add,
            color: AppColors.yellowIconColor,
          ),
        RoundedIconButton(
          onTap: onRemoveTap,
          icon: isFirst ? Icons.delete : Icons.remove,
          color: AppColors.redIconColor,
        ),
      ],
    );
  }
}

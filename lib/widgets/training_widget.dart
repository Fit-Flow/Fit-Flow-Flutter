import 'package:fit_flow_flutter/widgets/training_field.dart';
import 'package:fit_flow_flutter/widgets/workout_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/workout_model.dart';
import '../../view_models/training_viewmodel.dart';
import '../utils/app_colors.dart';
import 'buttons/rounded_icon_button.dart';
import 'dialogs/workout_dialog.dart';

/// A widget that represents a training workout.
///
/// The [workout] parameter represents the workout object.
/// The [index] parameter is the index of the workout in the list.
///
///authors: Jackie, Christoffer & Jakob
class TrainingWidget extends StatefulWidget {
  final Workout workout;
  final int index;

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
                        workoutIndex: widget.index,
                        setIndex: index,
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

class TrainingSetWidget extends StatefulWidget {
  final VoidCallback onAddTap;
  final VoidCallback onRemoveTap;
  final bool showAddButton;
  final bool isFirst;
  final int workoutIndex;
  final int setIndex;

  /// A widget that represents a training set.
  ///
  /// The [onAddTap] callback is called when the add button is tapped.
  /// The [onRemoveTap] callback is called when the remove button is tapped.
  /// The [showAddButton] parameter determines whether the add button is visible.
  /// The [isFirst] parameter indicates whether this is the first training set.
  /// The [workoutIndex] is the index of the parent workout.
  /// The [setIndex] is the index of this training set.
  ///
  /// Authors: Jackie, Christoffer & Jakob
  TrainingSetWidget({
    Key? key,
    required this.onAddTap,
    required this.showAddButton,
    this.isFirst = false,
    required this.onRemoveTap,
    required this.workoutIndex,
    required this.setIndex,
  }) : super(key: key);

  @override
  State<TrainingSetWidget> createState() => _TrainingSetWidgetState();
}

class _TrainingSetWidgetState extends State<TrainingSetWidget> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  @override
  void initState() {
    if (Get.find<TrainingViewModel>()
            .currentTraining
            .workouts[widget.workoutIndex]
            .workoutSets[widget.setIndex]
            .kilo !=
        0) {
      weightController.text = Get.find<TrainingViewModel>()
          .currentTraining
          .workouts[widget.workoutIndex]
          .workoutSets[widget.setIndex]
          .kilo
          .toString();
    }
    if (Get.find<TrainingViewModel>()
            .currentTraining
            .workouts[widget.workoutIndex]
            .workoutSets[widget.setIndex]
            .reps !=
        0) {
      repsController.text = Get.find<TrainingViewModel>()
          .currentTraining
          .workouts[widget.workoutIndex]
          .workoutSets[widget.setIndex]
          .reps
          .toString();
    }
    super.initState();
  }

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
          controller: weightController,
          onChange: (value) {
            Get.find<TrainingViewModel>().addWeight(widget.workoutIndex,
                widget.setIndex, int.parse(weightController.text));
          },
        ),
        TrainingField(
          hintText: 'Indtast',
          prefixText: 'Reps',
          suffixText: '',
          controller: repsController,
          onChange: (value) {
            Get.find<TrainingViewModel>().addReps(widget.workoutIndex,
                widget.setIndex, int.parse(repsController.text));
          },
        ),
        if (widget.showAddButton)
          RoundedIconButton(
            onTap: widget.onAddTap,
            icon: Icons.add,
            color: AppColors.yellowIconColor,
          ),
        RoundedIconButton(
          onTap: widget.onRemoveTap,
          icon: widget.isFirst ? Icons.delete : Icons.remove,
          color: AppColors.redIconColor,
        ),
      ],
    );
  }
}

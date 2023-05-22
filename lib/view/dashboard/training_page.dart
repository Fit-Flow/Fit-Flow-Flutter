import 'package:fit_flow_flutter/view_model/training_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/components/header_widget.dart';
import '../../utils/components/training_widget.dart';

/// The [TrainingPage] class represents the training page in the FitFlow app.
///
/// This page displays the list of workouts for the user to view and interact with.
///
///authors: Jackie, Christoffer & Jakob
class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<TrainingViewModel>(
            builder: (viewModel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    title: viewModel.currentTraining.name,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          viewModel.currentTraining.workouts.length,
                          (index) => TrainingWidget(
                            workout: viewModel.currentTraining.workouts[index],
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              );
            },
          )),
    );
  }
}

import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/buttons/rounded_icon_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/dialogs/goal_dialog.dart';
import 'package:fit_flow_flutter/utils/components/dialogs/snackbar_dialog.dart';
import 'package:fit_flow_flutter/utils/components/goal_field.dart';
import 'package:fit_flow_flutter/utils/components/training_field.dart';
import 'package:fit_flow_flutter/utils/components/workout_field.dart';
import 'package:fit_flow_flutter/view_model/goal_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/components/header_widget.dart';

/// The [GoalPage] class represents the goal page in the FitFlow app.
/// This page displays the user's goals and objectives.
///
///authors: Jackie, Christoffer & Jakob
class GoalPage extends StatefulWidget {
  GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  List<TextEditingController> controllers = [];

  bool isChange = false;

  @override
  void initState() {
    Get.find<GoalViewModel>().goals.forEach((element) {
      controllers.add(TextEditingController(text: element.goalWeight));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: GetBuilder<GoalViewModel>(
          builder: (viewModel) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: "Målsætning",
                ),
                if (viewModel.goals.isNotEmpty)
                  Column(
                    children: List.generate(viewModel.goals.length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            WorkoutField(
                                workout: viewModel.goals[index].workout,
                                onTap: () {}),
                            SizedBox(
                              width: 20,
                            ),
                            GoalField(
                              prefixText: '',
                              suffixText: '',
                              value: DateFormat('dd-MM-yyyy').format(
                                DateTime(2023, 3, 20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GoalField(
                                prefixText: 'PR',
                                suffixText: 'Kg',
                                value: viewModel.goals[index].prWeight),
                            SizedBox(
                              width: 20,
                            ),
                            TrainingField(
                                hintText: 'Set mål',
                                prefixText: 'Mål',
                                suffixText: 'Kg',
                                controller: controllers[index],
                                onChange: (value) {
                                  setState(() {
                                    isChange = true;
                                  });
                                })
                          ],
                        ),
                      );
                    }),
                  ),
                if (viewModel.goals.isEmpty)
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          'Du har ikke tilføjet nogle mål endnu, tryk på knappen og kom igang',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        RoundedIconButton(
                            onTap: () {
                              buildGoalDialog(0);
                              controllers.add(TextEditingController());
                              if (controllers.length > viewModel.goals.length) {
                                for (int i = 0; i < controllers.length; i++) {
                                  if (i > viewModel.goals.length) {
                                    controllers.removeLast();
                                  }
                                }
                              }
                            },
                            icon: Icons.add,
                            color: AppColors.yellowIconColor),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                if (viewModel.goals.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedIconButton(
                          onTap: () {
                            buildGoalDialog(viewModel.goals.length);
                            controllers.add(TextEditingController());
                            if (controllers.length > viewModel.goals.length) {
                              for (int i = 0; i < controllers.length; i++) {
                                if (i > viewModel.goals.length) {
                                  controllers.removeLast();
                                }
                              }
                            }
                          },
                          icon: Icons.add,
                          color: AppColors.yellowIconColor),
                      if (isChange)
                        SizedBox(
                          width: 120,
                          height: 60,
                          child: CustomButton(
                              text: 'Gem',
                              color: AppColors.yellowColor,
                              textColor: AppColors.backgroundColor,
                              onTap: () {
                                for (int i = 0; i < controllers.length; i++) {
                                  viewModel.updateGoalWeight(
                                      controllers[i].text, i);
                                }
                                setState(() {
                                  isChange = false;
                                  print('Click');
                                });
                                buildSuccessSnackBar(
                                    'Gemt', 'Dine mål er gemt');
                              }),
                        )
                    ],
                  ),
              ],
            );
          },
        ));
  }
}

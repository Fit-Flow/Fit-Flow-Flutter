import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/buttons/rounded_icon_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/goal_field.dart';
import 'package:fit_flow_flutter/utils/components/training_field.dart';
import 'package:fit_flow_flutter/utils/components/workout_field.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: "Målsætning",
          ),
          Column(
            children: List.generate(10, (index) {
              controllers.add(TextEditingController());
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    WorkoutField(workout: "Push up", onTap: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    GoalField(
                        prefixText: '',
                        suffixText: '',
                        value: DateFormat('dd-MM-yyyy')
                            .format(DateTime(2023, 3, 20))),
                    SizedBox(
                      width: 20,
                    ),
                    GoalField(prefixText: 'PR', suffixText: 'Kg', value: '35'),
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconButton(
                  onTap: () {},
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
                      onTap: () {}),
                )
            ],
          ),
        ],
      ),
    );
  }
}

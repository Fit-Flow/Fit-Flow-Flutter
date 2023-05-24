import 'package:flutter/material.dart';

import '../app_colors.dart';

/// A text field used to see the goal weight.
///
/// The [prefixText] is the text displayed before the user input.
/// The [suffixText] is the text displayed after the user input.
/// The [value] is the text displayed in the textfield
///
/// Authors: Jackie, Christoffer & Jakob
class GoalField extends StatelessWidget {
  final String prefixText;
  final String suffixText;
  final String value;

  const GoalField({
    Key? key,
    required this.prefixText,
    required this.suffixText,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        border: Border.all(color: AppColors.lightGreyColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            controller: TextEditingController(text: value),
            readOnly: true,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: AppColors.lightGreyColor,
              ),
              prefixIcon: prefixText != ''
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$prefixText: ',
                          style: TextStyle(
                            color: AppColors.lightGreyColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  : null,
              suffixIcon: suffixText != ''
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          suffixText,
                          style: TextStyle(
                            color: AppColors.lightGreyColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  : null,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

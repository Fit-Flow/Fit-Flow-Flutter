import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

/// A text field used in the training widget.
///
/// The [hintText] is the placeholder text displayed in the field.
/// The [prefixText] is the text displayed before the user input.
/// The [suffixText] is the text displayed after the user input.
/// The [controller] is the controller used to control the text field's input.
/// The [onChange] is the callback function invoked when the text field's value changes.
///
/// Authors: Jackie, Christoffer & Jakob
class TrainingField extends StatelessWidget {
  final String hintText;
  final String prefixText;
  final String suffixText;
  final TextEditingController controller;
  final Function(String value) onChange;

  const TrainingField({
    Key? key,
    required this.hintText,
    required this.prefixText,
    required this.suffixText,
    required this.controller,
    required this.onChange,
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
            controller: controller,
            onChanged: onChange,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.lightGreyColor,
              ),
              prefixIcon: Row(
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
              ),
              suffixIcon: Row(
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
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

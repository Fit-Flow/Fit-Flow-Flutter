import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// Represents a custom text field widget with customizable properties such as the input type,
/// label, password visibility, controller, and maximum width.
///
///authors: Jackie, Christoffer & Jakob
class CustomTextField extends StatelessWidget {
  final TextInputType textInputType;
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final double maxWidth;

  CustomTextField({
    this.textInputType = TextInputType.text,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.maxWidth = 500,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: TextField(
          controller: controller,
          style: TextStyle(color: AppColors.textColor),
          obscureText: isPassword,
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.lightGreyColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.lightGreyColor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0),
            ),
            labelStyle: TextStyle(
              color: AppColors.lightGreyColor,
            ),
            filled: true,
            fillColor: AppColors.darkGreyColor,
          ),
        ),
      ),
    );
  }
}

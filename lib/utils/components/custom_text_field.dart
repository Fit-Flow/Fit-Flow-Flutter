import 'package:flutter/material.dart';

import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class CustomTextField extends StatelessWidget {
  TextInputType textInputType;
  String label;
  bool isPassword;
  TextEditingController controller;
  double maxWidth;

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

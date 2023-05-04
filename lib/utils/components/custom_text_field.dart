import 'package:flutter/material.dart';

import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class CustomTextField extends StatelessWidget {
  TextInputType textInputType;
  String label;
  bool isPassword;

  CustomTextField({
    this.textInputType = TextInputType.text,
    required this.label,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: AppColors.textColor
      ),
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGreyColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGreyColor, width: 1.0),
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
    );
  }
}
import 'package:flutter/material.dart';

import '../app_colors.dart';

///
///Represents a custom button widget with customizable text, color, and onTap callback.
///
///authors: Jackie, Christoffer & Jakob

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  CustomButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: AppColors.lightGreyColor, width: 1.0),
          ),
        ),
      ),
    );
  }
}

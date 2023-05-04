import 'package:flutter/material.dart';

import '../app_colors.dart';

class RoundedLoginLogo extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  RoundedLoginLogo({
    required this.imagePath,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: AppColors.lightGreyColor),
            color: AppColors.darkGreyColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
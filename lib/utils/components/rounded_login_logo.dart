import 'package:flutter/material.dart';

import '../app_colors.dart';

/// A widget that displays a rounded login logo.
///
/// The `RoundedLoginLogo` widget is typically used in login screens or authentication flows
/// to display a logo with rounded corners that can be tapped.
/// The [imagePath] parameter is required and specifies the path to the image asset to be displayed.
/// The [onTap] parameter is required and specifies the callback function to be called when the logo is tapped.
///
///authors: Jackie, Christoffer & Jakob
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
            color: AppColors.darkGreyColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

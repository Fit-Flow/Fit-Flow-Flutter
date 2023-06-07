import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// Represents a profile settings widget that displays profile settings information.
///
///authors: Jackie, Christoffer & Jakob
class ProfileSettingsWidget extends StatelessWidget {
  const ProfileSettingsWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Indstillinger',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Klik på dit profilbillede for at ændre det',
          style: TextStyle(
            color: AppColors.lightGreyColor,
            fontSize: 16,
          ),
        ),
        Divider(
          height: 50,
          color: AppColors.lightGreyColor,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}

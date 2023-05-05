import 'package:flutter/material.dart';

import '../app_colors.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class ProfileTap extends StatelessWidget {

  final String imagePath;
  final String profileName;

  const ProfileTap({
    Key? key, required this.imagePath, required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagePath),
            ),
          ),
          Text(
            profileName,
            style: TextStyle(
              color: AppColors.lightGreyColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
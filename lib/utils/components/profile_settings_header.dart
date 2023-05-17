import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class ProfileSettingsHeader extends StatelessWidget {
  const ProfileSettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          child: ClipRRect(
            child: Image.asset('assets/img/test-profil.png'),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(color: AppColors.lightGreyColor, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }
}

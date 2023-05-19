import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/view_model/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

/// Represents the header section of the profile settings.
///
///authors: Jackie, Christoffer & Jakob
class ProfileSettingsHeader extends StatelessWidget {
  const ProfileSettingsHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationViewModel>(builder: (viewmodel) {
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(
                  color: AppColors.lightGreyColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

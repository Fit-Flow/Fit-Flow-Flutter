import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/view_models/authentication_viewmodel.dart';
import 'package:fit_flow_flutter/widgets/profile_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/responsive.dart';

/// Represents a custom app bar widget for the application.
/// Displays a responsive app bar with menu icon, profile image, and profile name.
///Supports user authentication and responsiveness using GetX and responsive.dart.
///
///authors: Jackie, Christoffer & Jakob
class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
      ),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: AppColors.textColor,
              ),
            ),
          Expanded(child: Container()),
          GetBuilder<AuthenticationViewModel>(builder: (viewmodel) {
            var currentUser = FirebaseAuth.instance.currentUser;
            String profileName =
                currentUser != null ? currentUser.displayName! : "";
            return ProfileTap(
              imagePath: 'assets/img/test-profil.png',
              profileName: profileName,
            );
          }),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

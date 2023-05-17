import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/components/profile_settings_header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSettingsHeader(),
          SizedBox(
            height: 25,
          ),
          ProfileSettingsWidget(),
        ],
      ),
    );
  }
}

class ProfileSettingsWidget extends StatelessWidget {
  const ProfileSettingsWidget({super.key});

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
              fontWeight: FontWeight.bold),
        ),
        Text('Klik på dit profilbillede for at ændre det'),
      ],
    );
  }
}

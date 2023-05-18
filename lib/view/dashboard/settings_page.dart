import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_text_field.dart';
import 'package:fit_flow_flutter/view_model/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/components/profile_settings_header.dart';
import '../../utils/components/profile_settings_widget.dart';
import '../../utils/components/profile_update_info.dart';

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
          ProfileUpdateInfo(),
        ],
      ),
    );
  }
}

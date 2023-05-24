import 'package:flutter/material.dart';

import '../../utils/components/profile_settings_header.dart';
import '../../utils/components/profile_settings_widget.dart';
import '../../utils/components/profile_update_info.dart';

/// The [SettingsPage] class represents the settings page in the FitFlow app.
///
/// This page allows users to update their profile information and settings.
///
///authors: Jackie, Christoffer & Jakob
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

import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../utils/components/dashboard_content.dart';
import '../../utils/components/drawer_menu.dart';

/**
 * @authors Jackie, Chistoffer & Jakob
 */
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: DrawerMenu(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: DashboardContent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

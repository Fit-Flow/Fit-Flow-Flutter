import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_appbar.dart';
import 'package:fit_flow_flutter/view/dashboard/start_page.dart';
import 'package:flutter/material.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: StartPage(
              
            ),
          ),
        ],
      )
    );
  }
}

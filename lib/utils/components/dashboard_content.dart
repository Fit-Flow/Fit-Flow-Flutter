import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_appbar.dart';
import 'package:fit_flow_flutter/view_model/drawer_navigation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class DashboardContent extends StatefulWidget {
  DashboardContent({Key? key}) : super(key: key);

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(
            height: 20,
          ),
         GetBuilder<DrawerNavigationViewModel>(builder: (drawerNav) {
           return drawerNav.selectedPage;
         })
        ],
      )
    );
  }
}

import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/profile_tap.dart';
import 'package:flutter/material.dart';

import '../controller.dart';
import '../responsive.dart';

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
              icon: Icon(Icons.menu,color: AppColors.textColor,),
            ),
          Expanded(child: Container()),
          ProfileTap(
            imagePath: 'assets/img/test-profil.png',
            profileName: 'Jakob Majid',
          ),
          SizedBox(width: 30,),
        ],
      ),
    );
  }
}
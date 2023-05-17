import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';

void buildErrorSnackBar(title, message) {
  Get.snackbar(title, message,
      maxWidth: 200,
      colorText: AppColors.textColor,
      backgroundColor: AppColors.redColor,
      titleText: Text(
        title,
        style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        textAlign: TextAlign.center,
      ));
}

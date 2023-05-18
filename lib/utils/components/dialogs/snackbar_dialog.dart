import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';

/**
 *
 * @authors Jackie, Christoffer & Jakob
 */

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

void buildSuccessSnackBar(title, message) {
  Get.snackbar(title, message,
      maxWidth: 200,
      colorText: AppColors.textColor,
      backgroundColor: AppColors.greenColor,
      titleText: Text(
        title,
        style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        textAlign: TextAlign.center,
      ));
}

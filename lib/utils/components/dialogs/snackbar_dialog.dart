import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_colors.dart';

/// Displays an error snackbar with the specified [title] and [message].
///
/// The [title] is the title text displayed on the snackbar.
/// The [message] is the content text displayed on the snackbar.
///
/// authors: Jackie, Christoffer & Jakob
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

/// Displays a success snackbar with the specified [title] and [message].
///
/// The [title] is the title text displayed on the snackbar.
/// The [message] is the content text displayed on the snackbar.
///
/// authors: Jackie, Christoffer & Jakob
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

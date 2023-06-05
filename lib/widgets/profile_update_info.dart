import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/authentication_viewmodel.dart';
import '../../widgets/custom_text_field.dart';
import '../utils/app_colors.dart';
import 'custom_button.dart';
import 'dialogs/snackbar_dialog.dart';

/// A widget for updating user profile information.
///
///authors: Jackie, Christoffer & Jakob
class ProfileUpdateInfo extends StatelessWidget {
  ProfileUpdateInfo({Key? key});

  final firstNameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]);
  final lastNameController = TextEditingController(
      text: Get.find<AuthenticationViewModel>()
          .getLastName(FirebaseAuth.instance.currentUser!.displayName!));
  final emailController =
      TextEditingController(text: FirebaseAuth.instance.currentUser!.email!);
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profil',
          style: TextStyle(
              color: AppColors.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 20,
          children: [
            CustomTextField(
              label: 'Fornavn',
              controller: firstNameController,
              maxWidth: 300,
            ),
            CustomTextField(
              label: 'Efternavn',
              controller: lastNameController,
              maxWidth: 300,
            ),
            CustomTextField(
              label: 'Email',
              controller: emailController,
              maxWidth: 300,
            ),
          ],
        ),
        Wrap(
          spacing: 20,
          children: [
            CustomTextField(
              label: 'Nuværende kodeord',
              controller: passwordController,
              maxWidth: 300,
              isPassword: true,
            ),
            CustomTextField(
              label: 'Ny kodeord',
              controller: newPasswordController,
              maxWidth: 300,
              isPassword: true,
            ),
            CustomTextField(
              label: 'Bekræft kodeord',
              controller: confirmPasswordController,
              maxWidth: 300,
              isPassword: true,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 140,
          child: CustomButton(
              text: 'Gem',
              color: AppColors.yellowColor,
              textColor: AppColors.backgroundColor,
              onTap: () {
                if (firstNameController.text.isNotEmpty &&
                    lastNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  if (emailController.text !=
                      FirebaseAuth.instance.currentUser!.email!) {
                    Get.find<AuthenticationViewModel>()
                        .updateEmail(emailController.text);
                  }

                  if (firstNameController.text !=
                          FirebaseAuth.instance.currentUser!.displayName!
                              .split(' ')[0] ||
                      lastNameController.text !=
                          Get.find<AuthenticationViewModel>().getLastName(
                              FirebaseAuth
                                  .instance.currentUser!.displayName!)) {
                    Get.find<AuthenticationViewModel>().updateDisplayName(
                        firstNameController.text, lastNameController.text);
                  }
                } else {
                  buildErrorSnackBar('Fejl', 'Alle felter skal udfyldes');
                }

                if (newPasswordController.text ==
                    confirmPasswordController.text) {
                  if (passwordController.text.isNotEmpty &&
                      newPasswordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty) {
                    Get.find<AuthenticationViewModel>().updatePassword(
                        passwordController.text, newPasswordController.text);
                    passwordController.text = '';
                    newPasswordController.text = '';
                    confirmPasswordController.text = '';
                  }
                }
              }),
        ),
      ],
    );
  }
}

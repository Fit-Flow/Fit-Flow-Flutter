import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/dialogs/snackbar_dialog.dart';

/// The [ForgotPasswordPage] class represents the forgot password page in the FitFlow app.
///
/// This page allows users to reset their password by entering their email address.
/// Users will receive an email with a password reset link to change their password.
///
///authors: Jackie, Christoffer & Jakob
class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'assets/img/FitFlowLogo.png',
                child: Image.asset(
                  'assets/img/FitFlowLogo.png',
                  width: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Har du glemt dit kodeord?',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Skriv din email i feltet under, så sender vi dig et link. Her kan du ændre din kode.',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                label: 'E-mail',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Send',
                color: AppColors.yellowColor,
                textColor: AppColors.darkGreyColor,
                onTap: () async {
                  if (emailController.text.isNotEmpty) {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );
                      buildSuccessSnackBar(
                        'Udført',
                        'Email med nyt kodeord sendt',
                      );
                    } on FirebaseAuthException catch (e) {
                      buildErrorSnackBar('Fejl', e.message);
                    }
                  } else {
                    buildErrorSnackBar('Fejl', 'Udfyld venligst feltet');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

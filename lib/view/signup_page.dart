import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_text_field.dart';
import 'package:fit_flow_flutter/utils/components/dialogs/snackbar_dialog.dart';
import 'package:fit_flow_flutter/view_model/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The [SignupPage] class represents the signup page in the FitFlow app.
///
/// This page allows users to sign up by providing their first name, last name, email, and password.
/// It includes input fields for each of these details and a signup button.
/// When the signup button is tapped, the entered details are validated and passed to the [AuthenticationViewModel] to create a new user.
///
///authors: Jackie, Christoffer & Jakob
class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: GetBuilder<AuthenticationViewModel>(
          builder: (viewModel) {
            return Stack(
              children: [
                Center(
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
                        CustomTextField(
                          label: 'Fornavn',
                          controller: firstNameController,
                        ),
                        CustomTextField(
                          label: 'Efternavn',
                          controller: lastNameController,
                        ),
                        CustomTextField(
                          label: 'E-mail',
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          label: 'Kodeord',
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        CustomTextField(
                          label: 'Gentag kodeord',
                          controller: confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: 'Opret',
                          color: AppColors.yellowColor,
                          textColor: AppColors.darkGreyColor,
                          onTap: () {
                            if (firstNameController.text.isNotEmpty &&
                                lastNameController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty &&
                                confirmPasswordController.text.isNotEmpty) {
                              if (GetUtils.isEmail(emailController.text)) {
                                if (passwordController.text ==
                                    confirmPasswordController.text) {
                                  Get.find<AuthenticationViewModel>()
                                      .createUser(
                                    emailController.text,
                                    passwordController.text,
                                    firstNameController.text,
                                    lastNameController.text,
                                  );
                                } else {
                                  print('Koden er ikke ens!');
                                  buildErrorSnackBar(
                                      'Fejl', 'Koden er ikke ens!');
                                }
                              } else {
                                buildErrorSnackBar(
                                    'Fejl', 'Email er ikke valid!');
                              }
                            } else {
                              buildErrorSnackBar(
                                  'Fejl', 'Alle felter skal udfyldes');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                if (viewModel.isLoading)
                  Stack(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.transparent,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellowColor,
                          strokeWidth: 10,
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },
        ));
  }
}

import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_text_field.dart';
import 'package:fit_flow_flutter/utils/components/dialogs/snackbar_dialog.dart';
import 'package:fit_flow_flutter/view_model/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 *
 * @authors Jackie, Christoffer & Jakob
 */
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
              CustomTextField(
                  label: 'Fornavn', controller: firstNameController),
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
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    Get.find<AuthenticationViewModel>().createUser(
                        emailController.text, passwordController.text);
                  } else {
                    print('Koden er ikke ens!');
                    buildErrorSnackBar('Fejl', 'Koden er ikke ens!');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

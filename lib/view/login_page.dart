import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/view/forgot_password_page.dart';
import 'package:fit_flow_flutter/view_model/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/components/custom_button.dart';
import '../utils/components/custom_text_field.dart';
import '../utils/components/rounded_login_logo.dart';

/// The [LoginPage] class represents the login page in the FitFlow app.
///
/// This page allows users to log in by providing their email and password.
/// It includes input fields for email and password, as well as options for password recovery and social media login.
/// Users can tap on the "Log in" button to authenticate their credentials and access the app.
/// If they don't have an account, they can tap on the "Opret bruger" button to navigate to the signup page.
///
///authors: Jackie, Christoffer & Jakob
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'assets/img/FitFlowLogo.png',
                child: Image.asset(
                  'assets/img/FitFlowLogo.png',
                  width: 300,
                ),
              ),
              CustomTextField(
                label: "E-mail",
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                label: 'Kodeord',
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed("/forgot");
                  },
                  child: Text(
                    'Glemt kodeord?',
                    style: TextStyle(
                      color: AppColors.lightGreyColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Log in',
                color: AppColors.yellowColor,
                textColor: AppColors.darkGreyColor,
                onTap: () {
                  Get.find<AuthenticationViewModel>().login(
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Opret bruger',
                color: AppColors.darkGreyColor,
                textColor: AppColors.yellowColor,
                onTap: () {
                  Get.toNamed("/signup");
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedLoginLogo(
                    imagePath: 'assets/icon/icon-google.png',
                    onTap: () {},
                  ),
                  RoundedLoginLogo(
                    imagePath: 'assets/icon/icon-facebook.png',
                    onTap: () {},
                  ),
                  RoundedLoginLogo(
                    imagePath: 'assets/icon/icon-twitter.png',
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

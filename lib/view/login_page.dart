import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/components/custom_button.dart';
import '../utils/components/custom_text_field.dart';
import '../utils/components/rounded_login_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              Image.asset(
                'assets/img/FitFlowLogo.png',
                width: 300,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: "E-mail",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'Kodeord',
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
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
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Opret bruger',
                color: AppColors.darkGreyColor,
                textColor: AppColors.yellowColor,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedLoginLogo(
                    imagePath: 'assets/icon/icon-google.png',
                    onTap: (){},
                  ),
                  RoundedLoginLogo(
                    imagePath: 'assets/icon/icon-facebook.png',
                    onTap: (){},
                  ),
                  RoundedLoginLogo(
                    imagePath: 'assets/icon/icon-twitter.png',
                    onTap: (){},
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

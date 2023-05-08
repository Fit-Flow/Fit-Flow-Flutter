import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 *
 * @authors Jackie, Christoffer & Jakob
 */
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
              CustomTextField(label: 'Fornavn'),
              CustomTextField(label: 'Efternavn'),
              CustomTextField(
                label: 'E-mail',
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                label: 'Kodeord',
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              CustomTextField(
                label: 'Gentag kodeord',
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
                onTap: (){
                    //TODO: tilføj opret funktion
                  Get.offNamed("/dashboard");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

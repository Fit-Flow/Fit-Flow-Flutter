import 'package:fit_flow_flutter/utils/app_colors.dart';
import 'package:fit_flow_flutter/utils/components/custom_button.dart';
import 'package:fit_flow_flutter/utils/components/custom_text_field.dart';
import 'package:flutter/material.dart';


/**
 * @authors Jackie, Christoffer & Jakob
 */
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
              SizedBox(height: 20,),
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
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(text: 'Send', color: AppColors.yellowColor, textColor: AppColors.darkGreyColor, onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}

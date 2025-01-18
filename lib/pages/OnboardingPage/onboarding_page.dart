import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/pages/OnboardingPage/components/components.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorsys.xprimary,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              WelcomeTitieText(),
              SizedBox(
                height: 10,
              ),
              WelcomeDescrp(),
              SizedBox(
                height: 300,
              ),
              GetStartedButton()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'components.dart';

import 'package:flutter/material.dart';

class DoctorLoginScreen extends StatelessWidget {
  const DoctorLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Doctor Login',
          style: TextStyle(
              fontFamily: 'Kumbh',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColorsys.xprimary),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              LoginText(),
              SizedBox(
                height: 10,
              ),
              DocTextFieldSection(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(fontFamily: 'Kumbh', fontSize: 15),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              LoginButton(),
              SizedBox(
                height: 30,
              ),
              CreateAcc()
            ],
          ),
        ),
      ),
    );
  }
}

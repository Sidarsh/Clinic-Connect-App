import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/UserLoginPage/components/components.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'User Login',
          style: TextStyle(
              fontFamily: 'Kumbh',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColorsys.xprimary),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  LoginText(),
                  SizedBox(
                    height: 20,
                  ),
                  EandPTextFieldSection(),
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
          Positioned(
            bottom: 20,
            right: 20,
            child: SizedBox(
              height: 50,
              width: 150,
              child: FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorLoginScreen()));
                },
                label: Text(
                  'Doctor Login',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.medical_services,
                  color: Colors.white,
                ),
                backgroundColor: AppColorsys.xbgblue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

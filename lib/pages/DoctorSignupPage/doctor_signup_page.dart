import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/pages/DoctorSignupPage/components/components.dart';
import 'package:flutter/material.dart';

class DoctorSignupPage extends StatefulWidget {
  const DoctorSignupPage({super.key});

  @override
  State<DoctorSignupPage> createState() => _DoctorSignupPageState();
}

class _DoctorSignupPageState extends State<DoctorSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsys.xbgblue,
        title: Text(
          "Doctor Sign Up",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DocSignUpTitle(),
            SizedBox(
              height: 30,
            ),
            DSTextFormField(),
            SizedBox(
              height: 30,
            ),
            DocSignUpButton()
          ],
        ),
      ),
    );
  }
}

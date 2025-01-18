import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/ReceptionistDashboard/receptionist_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Docwrapper extends StatefulWidget {
  const Docwrapper({super.key});

  @override
  State<Docwrapper> createState() => _DocwrapperState();
}

class _DocwrapperState extends State<Docwrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ReceptionistDashboard();
            } else {
              return DoctorLoginScreen();
            }
          }),
    );
  }
}

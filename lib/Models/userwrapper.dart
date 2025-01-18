import 'package:doctor_appointment_app/pages/OnboardingPage/onboarding_page.dart';
import 'package:doctor_appointment_app/pages/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userwrapper extends StatefulWidget {
  const Userwrapper({super.key});

  @override
  State<Userwrapper> createState() => _UserwrapperState();
}

class _UserwrapperState extends State<Userwrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return snapshot.hasData ? MainScreen() : OnboardingPage();
          }),
    );
  }
}

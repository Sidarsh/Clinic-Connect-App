import 'dart:async';
import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/OnboardingPage/onboarding_page.dart';
import 'package:doctor_appointment_app/pages/ReceptionistDashboard/receptionist_dashboard.dart';
import 'package:doctor_appointment_app/pages/UserLoginPage/login_page.dart';
import 'package:doctor_appointment_app/pages/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Key for storing the login status and first-time status in SharedPreferences
  static const String KEYVAL = 'Login';
  static const String FIRST_TIME_KEY = 'isFirstTime';
  static const String ROLE = 'Role';

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Image.asset(
          'images/SplashScreen/splashscreen.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // This function is now async and properly handles the navigation logic
  void _navigateToNextScreen() async {
    var sharedPref = await SharedPreferences.getInstance();
    bool isFirstTime = sharedPref.getBool(FIRST_TIME_KEY) ?? true;
    bool? isLoggedIn = sharedPref.getBool(KEYVAL);
    String? role = sharedPref.getString(ROLE);

    Timer(const Duration(seconds: 3), () {
      if (isFirstTime) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingPage()),
        );
        sharedPref.setBool(FIRST_TIME_KEY, false);
      } else {
        if (isLoggedIn == true) {
          // Redirect based on role
          if (role == 'User') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          } else if (role == 'Doctor') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ReceptionistDashboard()),
            );
          }
        } else {
          // Redirect to the appropriate login screen
          if (role == 'Doctor') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DoctorLoginScreen()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        }
      }
    });
  }
}

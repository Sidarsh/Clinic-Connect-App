import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/SplashScreen/splash_screen.dart';
import 'package:doctor_appointment_app/pages/UserLoginPage/login_page.dart';
import 'package:doctor_appointment_app/pages/mainscreen/main_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

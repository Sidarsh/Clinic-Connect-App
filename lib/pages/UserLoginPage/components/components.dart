import 'package:doctor_appointment_app/Models/validation.dart';
import 'package:doctor_appointment_app/pages/SplashScreen/splash_screen.dart';

import 'package:doctor_appointment_app/pages/UserSignupPage/user_signup.dart';
import 'package:doctor_appointment_app/pages/mainscreen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController _emailcontroller = TextEditingController();

final TextEditingController _passwordcontroller = TextEditingController();

signIn(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
    );
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign-in successful!')),
    );
    Navigator.pushReplacement(
      
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );

    // Navigate to the main screen after successful login
    var sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool(SplashScreenState.KEYVAL, true);
     var rolepref = await SharedPreferences.getInstance();
     rolepref.setString(SplashScreenState.ROLE, 'User');




    _emailcontroller.clear();
    _passwordcontroller.clear();
  } on FirebaseAuthException {
    String message = 'Invalid email or password. Please try again.';

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An unexpected error occurred: $e')),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        "Log into\nyour account",
        style: TextStyle(
            fontFamily: 'Kumbh',
            fontSize: 42,
            fontWeight: FontWeight.w900,
            color: AppColorsys.xprimary),
      ),
    );
  }
}

class EandPTextFieldSection extends StatefulWidget {
  const EandPTextFieldSection({super.key});

  @override
  State<EandPTextFieldSection> createState() => _EandPTextFieldSectionState();
}

class _EandPTextFieldSectionState extends State<EandPTextFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        spacing: 30.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailcontroller,
            validator: emailVaildation,
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: 'Email',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColorsys.xprimary,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          TextFormField(
            controller: _passwordcontroller,
            validator: passwordValidation,
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                        style: BorderStyle.solid))),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 50), backgroundColor: AppColorsys.xprimary),
        onPressed: () async {
          signIn(context);
        },
        child: Text(
          "Login",
          style: TextStyle(
              fontFamily: 'Kumbh',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
      ),
    );
  }
}

class CreateAcc extends StatelessWidget {
  const CreateAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        GestureDetector(
            onTap: () {
              Get.to(UserSignupPage());
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: AppColorsys.xprimary, fontWeight: FontWeight.w700),
            ))
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/Models/validation.dart';
import 'package:doctor_appointment_app/pages/DocDetailPage/doc_detail.dart';
import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/DoctorSignupPage/doctor_signup_page.dart';
import 'package:doctor_appointment_app/pages/ReceptionistDashboard/receptionist_dashboard.dart';
import 'package:doctor_appointment_app/pages/SplashScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _doclformKey = GlobalKey<FormState>();
final TextEditingController _emailcontroller = TextEditingController();

final TextEditingController _passwordcontroller = TextEditingController();
signIn(BuildContext context) async {
  try {
    // Attempt to sign in the user
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
    );

    // Check the user's role in Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(_emailcontroller.text)
        .get();

    if (userDoc.exists) {
      String? role = userDoc['role'];

      if (role == 'Doctor') {
        // Allow login if role is 'Doctor'
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-in successful!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ReceptionistDashboard()),
        );

        // Clear input fields
        _emailcontroller.clear();
        _passwordcontroller.clear();
      } else {
        // Deny login if role is not 'Doctor'
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Access denied: Only doctors can log in.')),
        );
      }
    } else {
      // If no user document exists, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User does not exist. Please sign up first.')),
      );
    }
  } on FirebaseAuthException {
    // Handle Firebase authentication errors
    String message = 'Invalid email or password. Please try again.';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  } catch (e) {
    // Handle other errors
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
        "Doctor Login",
        style: TextStyle(
            fontFamily: 'Kumbh',
            fontSize: 42,
            fontWeight: FontWeight.w900,
            color: AppColorsys.xprimary),
      ),
    );
  }
}

class DocTextFieldSection extends StatefulWidget {
  const DocTextFieldSection({super.key});

  @override
  State<DocTextFieldSection> createState() => _DocTextFieldSectionState();
}

class _DocTextFieldSectionState extends State<DocTextFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Form(
        key: _doclformKey,
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
        onPressed: () {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DoctorSignupPage()));
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

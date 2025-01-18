import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/Models/validation.dart';
import 'package:doctor_appointment_app/pages/ReceptionistDashboard/receptionist_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _dsignupformKey = GlobalKey<FormState>();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

Future<void> registerUser(String email, String password, String role) async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  try {
    // Create user account
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Save user details in Firestore with email as the document ID
    await firestore.collection('users').doc(email).set({
      'role': role,
    });

    print('User registered and Firestore document created successfully.');
  } catch (e) {
    print('Error during registration: $e');
  }
}

class DocSignUpTitle extends StatelessWidget {
  const DocSignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 16.0),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Text(
        "Create an\naccount",
        style: TextStyle(
            fontFamily: 'Kumbh',
            fontWeight: FontWeight.bold,
            fontSize: 38.0,
            color: AppColorsys.xbgblue),
      ),
    );
  }
}

class DSTextFormField extends StatefulWidget {
  const DSTextFormField({super.key});

  @override
  State<DSTextFormField> createState() => _DSTextFormFieldState();
}

class _DSTextFormFieldState extends State<DSTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0, left: 16.0),
      child: Form(
        key: _dsignupformKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              validator: emailVaildation,
              decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(235, 53, 66, 255),
                          width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(235, 53, 66, 255),
                          width: 2.5))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: password,
              validator: passwordValidation,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(235, 53, 66, 255),
                          width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(235, 53, 66, 255),
                          width: 2.5))),
            ),
          ],
        ),
      ),
    );
  }
}

class DocSignUpButton extends StatefulWidget {
  const DocSignUpButton({super.key});

  @override
  State<DocSignUpButton> createState() => _DocSignUpButtonState();
}

class _DocSignUpButtonState extends State<DocSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: ElevatedButton(
          autofocus: true,
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: AppColorsys.xbgblue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          onPressed: () {
            if (_dsignupformKey.currentState!.validate()) {
              registerUser(email.text, password.text, 'Doctor').then((_) {
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Account created successfully!")),
                );

                // Navigate to the main screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReceptionistDashboard()), // Replace MainScreen with your target screen
                );
              }).catchError((error) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $error")),
                );
              });
            }
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          )),
    );
  }
}

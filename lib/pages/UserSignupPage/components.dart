import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/Models/validation.dart';
import 'package:doctor_appointment_app/pages/mainscreen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

final _formKey = GlobalKey<FormState>();

class UserSignUpTitle extends StatelessWidget {
  const UserSignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 16.0),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Text(
        "Create an\naccount",
        style: TextStyle(
          fontFamily: 'Kumbh',
          fontWeight: FontWeight.bold,
          fontSize: 38.0,
          color: AppColorsys.xbgblue,
        ),
      ),
    );
  }
}

class USTextFormField extends StatefulWidget {
  const USTextFormField({super.key});

  @override
  State<USTextFormField> createState() => _USTextFormFieldState();
}

class _USTextFormFieldState extends State<USTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
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
                  borderSide: const BorderSide(
                    color: Color.fromARGB(235, 53, 66, 255),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(235, 53, 66, 255),
                    width: 2.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: password,
              validator: passwordValidation,
              obscureText: true, // Secure password field
              decoration: InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(235, 53, 66, 255),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(235, 53, 66, 255),
                    width: 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserSignUpButton extends StatefulWidget {
  const UserSignUpButton({super.key});

  @override
  State<UserSignUpButton> createState() => _UserSignUpButtonState();
}

class _UserSignUpButtonState extends State<UserSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: AppColorsys.xbgblue,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            registerUser(email.text, password.text, 'User').then((_) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account created successfully!")),
              );
              
              // Navigate to the main screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()), // Replace MainScreen with your target screen
              );
            }).catchError((error) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: $error")),
              );
            });
          }
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

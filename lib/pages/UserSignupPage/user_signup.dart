import 'package:doctor_appointment_app/pages/UserSignupPage/components.dart';
import 'package:flutter/material.dart';

class UserSignupPage extends StatefulWidget {
  const UserSignupPage({super.key});

  @override
  State<UserSignupPage> createState() => _UserSignupPageState();
}

class _UserSignupPageState extends State<UserSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color.fromARGB(235, 53, 66, 255),
          title: Text(
            "User Sign Up ",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserSignUpTitle(),
              SizedBox(
                height: 30,
              ),
              USTextFormField(),
              SizedBox(
                height: 30,
              ),
              UserSignUpButton()
            ],
          ),
        ));
  }
}

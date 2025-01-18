import 'package:doctor_appointment_app/pages/DocORUserSignIn/doc_user_signin.dart';
import 'package:doctor_appointment_app/pages/UserLoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';

class WelcomeTitieText extends StatelessWidget {
  const WelcomeTitieText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          width: 300,
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to ",
                  style: TextStyle(
                      fontFamily: 'Kumbh',
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
              Row(
                children: [
                  Text("Clinic",
                      style: TextStyle(
                          fontFamily: 'Kumbh',
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                  Text("Connect",
                      style: TextStyle(
                          fontFamily: 'Kumbh',
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(3, 12, 168, 1))),
                ],
              ),
            ],
          ),
        ));
  }
}

class WelcomeDescrp extends StatelessWidget {
  const WelcomeDescrp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
          "From booking appointments to tracking your turn, we’re here to make your clinic visits stress-free and efficient.",
          style: TextStyle(
              fontFamily: 'Kumbh',
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white)),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 50), backgroundColor: Colors.white),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text(
          "Get Started",
          style: TextStyle(
              fontFamily: 'Kumbh',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColorsys.xprimary),
        ),
      ),
    );
  }
}

import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/UserLoginPage/login_page.dart';

import 'package:flutter/material.dart';

class DUCreateAccText extends StatelessWidget {
  const DUCreateAccText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Text(
            "Who are you?",
            style: TextStyle(
                fontFamily: 'Kumbh',
                fontSize: 42,
                fontWeight: FontWeight.w900,
                color: AppColorsys.xprimary),
          ),
        ],
      ),
    );
  }
}

class DocPatImg extends StatelessWidget {
  const DocPatImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 42.0),
          width: 100,
          height: 100,
          child: Image.asset('images/SigninAS/doctor.png'),
        ),
        Container(
          margin: EdgeInsets.only(right: 44.0),
          width: 100,
          height: 100,
          child: Image.asset('images/SigninAS/patient.png'),
        )
      ],
    );
  }
}

class DoctorUserButton extends StatefulWidget {
  const DoctorUserButton({super.key});

  @override
  State<DoctorUserButton> createState() => _DoctorButtonState();
}

class _DoctorButtonState extends State<DoctorUserButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DoctorLoginScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(235, 53, 66, 255),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  'Doctor',
                  style: TextStyle(
                      fontFamily: 'Kumbh',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(235, 53, 66, 255),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  'User',
                  style: TextStyle(
                      fontFamily: 'Kumbh',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

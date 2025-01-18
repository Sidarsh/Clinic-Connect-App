// ignore: file_names
import 'package:doctor_appointment_app/pages/DocORUserSignIn/components.dart';
import 'package:flutter/material.dart';

class DocUserSignup extends StatefulWidget {
  const DocUserSignup({super.key});

  @override
  State<DocUserSignup> createState() => _DocUserSignupState();
}

class _DocUserSignupState extends State<DocUserSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(235, 53, 66, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Clinic",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Kumbh',
                    color: Colors.white),
              ),
            ),
            Text(
              "Connect",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Kumbh',
                  color: const Color.fromARGB(255, 15, 5, 126)),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DUCreateAccText(),
            SizedBox(
              height: 100,
            ),
            DocPatImg(),
            SizedBox(
              height: 10,
            ),
            DoctorUserButton()
          ],
        ),
      ),
    );
  }
}

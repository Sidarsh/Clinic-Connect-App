import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/pages/DocDetailPage/components/components.dart';
import 'package:doctor_appointment_app/pages/DoctorProfile/components/components.dart';
import 'package:flutter/material.dart';

class DocDetail extends StatelessWidget {
  final DocumentSnapshot doctor; // Declare the doctor data

  const DocDetail(
      {super.key, required this.doctor}); // Accept doctor data via constructor

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          debugPrint("User wants to book appointment");
        },
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(235, 53, 66, 255),
          ),
          child: Center(
            child: Text(
              "Get Appointment",
              style: TextStyle(fontSize: 24, fontFamily: 'Kumbh'),
            ),
          ),
        ),
      ),
      appBar: AppBar(
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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Color.fromARGB(235, 53, 66, 255),
                  ),
                  SafeArea(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            "${doctor['name']}'s Clinic", // Display the doctor's name
                            style: TextStyle(
                                fontFamily: 'Kumbh',
                                fontSize: 26.0,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ],
                  )),
                  DocProfilePic(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //Doctor Name
              DocProfileTitleAndDesc(
                  doctor: doctor), // Pass the doctor data to this widget
              SizedBox(
                height: 50,
              ),
              OngoingAppointment(),
              SizedBox(
                height: 30,
              ),
              AddressAndTiming(doctor: doctor,),
              SizedBox(
                height: 30,
              ),
              PatientFeedback(),
            ],
          ),
        ),
      ),
    );
  }
}

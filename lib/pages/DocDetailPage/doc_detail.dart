import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/pages/AppointBookingPage/appoint_booking.dart';
import 'package:doctor_appointment_app/pages/BookingPage/booking_page.dart';
import 'package:doctor_appointment_app/pages/DocDetailPage/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DocDetail extends StatelessWidget {
  final DocumentSnapshot doctor;
  const DocDetail({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.to(AppointBooking());
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
                            "Hemant Gupta's Clinic",
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
                doctor: doctor,
              ),
              SizedBox(
                height: 50,
              ),
              OngoingAppointment(),
              SizedBox(
                height: 30,
              ),
              AddressAndTiming(
                doctor: doctor,
              ),

              SizedBox(
                height: 30,
              ),
              PatientFeedback()
            ],
          ),
        ),
      ),
    );
  }
}

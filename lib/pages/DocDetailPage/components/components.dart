import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:flutter/material.dart';

class DocProfilePic extends StatelessWidget {
  const DocProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 125,
        ),
        Row(
          children: [
            SizedBox(
              width: 120,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Image.asset(
                'images/DoctorDetail/doctor_profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DocProfileTitleAndDesc extends StatelessWidget {
  final DocumentSnapshot doctor; 

  const DocProfileTitleAndDesc(
      {super.key, required this.doctor}); 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Text(
          doctor['name'] ??
              "Dr. Unknown", 
          style: TextStyle(fontSize: 24, fontFamily: 'Kumbh'),
        ),
        SizedBox(
          height: 10,
        ),
        
        Text(
          doctor['specialization'] ??
              "Specialization not available",
          style: TextStyle(fontSize: 12, fontFamily: 'Kumbh'),
          textAlign: TextAlign.center,
        ),
        
        Text(
          doctor['qualification'] ??
              "qualification not available", 
          style: TextStyle(fontSize: 12, fontFamily: 'Kumbh'),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OngoingAppointment extends StatelessWidget {
  const OngoingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ongoing Appointment",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w900, fontFamily: 'Kumbh'),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 120,
          width: 144,
          decoration: BoxDecoration(
              color: AppColorsys.xgreybackground,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "24",
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Kumbh'),
              ),
              Text(
                "31-05-2025",
                style: TextStyle(fontSize: 14, fontFamily: 'Kumbh'),
              ),
              Text(
                "16:04:34",
                style: TextStyle(fontSize: 14, fontFamily: 'Kumbh'),
              )
            ],
          ),
        )
      ],
    );
  }
}

class AddressAndTiming extends StatelessWidget {
  final DocumentSnapshot doctor; // Accept doctor data via constructor

  const AddressAndTiming(
      {super.key, required this.doctor}); // Constructor to accept doctor data

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the visit address
            Text(
              "Visit at:",
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              doctor['cadd'] ??
                  "Address not available", // Display address from Firestore
              style: TextStyle(fontFamily: 'Kumbh', fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Timing:",
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            Text("Morning",
                style: TextStyle(
                    fontFamily: 'Kumbh',
                    fontSize: 16,
                    fontWeight: FontWeight.w900)),
            Text(
              doctor['mtime'] ??
                  "Timing not available", // Display phone number from Firestore
              style: TextStyle(
                fontFamily: 'Kumbh',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Evening",
                style: TextStyle(
                    fontFamily: 'Kumbh',
                    fontSize: 16,
                    fontWeight: FontWeight.w900)),
            Text(
              doctor['etime'] ??
                  "Timing not available", // Display timing from Firestore
              style: TextStyle(
                fontFamily: 'Kumbh',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Display the phone number
            Text(
              "Phone no.:",
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              doctor['contact'] ??
                  "Phone number not available", // Display phone number from Firestore
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Fees",
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              doctor['fees'] ??
                  "Address not available", // Display address from Firestore
              style: TextStyle(fontFamily: 'Kumbh', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientFeedback extends StatelessWidget {
  const PatientFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your Experience Matters",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Kumbh'),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FeedbackCards(),
              FeedbackCards(),
              FeedbackCards(),
              FeedbackCards()
            ],
          ),
        ),
      ],
    );
  }
}

class FeedbackCards extends StatelessWidget {
  const FeedbackCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(197, 230, 228, 228),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0)),
      height: 350,
      width: 300,
      child: Column(
        children: [],
      ),
    );
  }
}

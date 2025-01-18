import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/appcolorsys.dart';
import 'package:doctor_appointment_app/pages/BookingPage/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:random_string/random_string.dart';

TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController healthstat = TextEditingController();
addPatientDetails() async {
  String docID = randomAlphaNumeric(10);
  var patdata = await FirebaseFirestore.instance
      .collection('patients')
      .doc(docID)
      .set({"name": name.text, "age": age.text, "healthstat": healthstat.text});
}

class BookingTitle extends StatelessWidget {
  const BookingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Text(
        "Booking Details",
        style: TextStyle(
            fontSize: 26.0, fontFamily: 'Kumbh', fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BPLoginTextFieldSection extends StatelessWidget {
  BPLoginTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: double.infinity,
      height: 400,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
                hintText: "Enter Patient's name",
                labelText: "Patient's name",
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15.0))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: age,
            decoration: InputDecoration(
                hintText: "Enter Patient's age",
                labelText: "Patient's Age",
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15.0))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: healthstat,
            decoration: InputDecoration(
                hintText: "Enter Patient's health status",
                labelText: "Patient's Health status",
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(15.0))),
          ),
        ],
      ),
    );
  }
}

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColorsys.xbgblue)),
          onPressed: () {
            addPatientDetails();
            Get.to(BookingPage());
          },
          child: Text(
            "Book Appointment",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

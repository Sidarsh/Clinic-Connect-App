import 'package:doctor_appointment_app/pages/mainscreen/components/components.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
                width: double.infinity,
                height: 200,
                color: Color.fromARGB(235, 53, 66, 255),
                child: Column(
                  children: [
                    TopScreen(),
                    Searchbar(),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Search by Speciality",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Kumbh',
                        color: Color.fromARGB(235, 26, 39, 232)),
                  ),
                  SizedBox(width: 10)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DoctorSpecBar(),
              SizedBox(
                height: 10,
              ),
              FeatureSlides(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "FAQs: Your Guide to Booking Doctor Appointments Online",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Kumbh',
                      color: Color.fromARGB(235, 26, 39, 232)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FAQSection(),
              SizedBox(
                height: 40,
              ),
              Vision(),
            ],
          ),
        ),
      ),
    );
  }
}

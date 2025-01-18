import 'package:flutter/material.dart';

class SucessfullyBookApp extends StatelessWidget {
  const SucessfullyBookApp({super.key});

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
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 200, left: 3.0, right: 3.0),
                child: Text(
                  "Your appointment has been successfully booked.\nThank you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Kumbh', fontSize: 16.5),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(235, 53, 66, 255))),
                  onPressed: () {},
                  child: Text(
                    "View Booking",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Kumbh',
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ));
  }
}

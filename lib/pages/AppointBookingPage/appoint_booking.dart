import 'package:doctor_appointment_app/pages/AppointBookingPage/components/components.dart';
import 'package:flutter/material.dart';

class AppointBooking extends StatefulWidget {
  const AppointBooking({super.key});

  @override
  State<AppointBooking> createState() => _AppointBookingState();
}

class _AppointBookingState extends State<AppointBooking> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookingTitle(),
              SizedBox(
                height: 30,
              ),
              BPLoginTextFieldSection(),
              SizedBox(
                height: 20,
              ),
              BookAppointment()
            ],
          ),
        ),
      ),
    );
  }
}

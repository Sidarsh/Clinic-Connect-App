import 'package:doctor_appointment_app/pages/DoctorLoginPage/doctor_login_screen.dart';
import 'package:doctor_appointment_app/pages/SplashScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceptionistDashboard extends StatefulWidget {
  const ReceptionistDashboard({super.key});

  @override
  State<ReceptionistDashboard> createState() => _ReceptionistDashboardState();
}

class _ReceptionistDashboardState extends State<ReceptionistDashboard> {
  Future<void> _signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Clear user role and session data
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool('isLoggedIn', false);
      sharedPref.remove('userRole');

      // Navigate to the Doctor Login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DoctorLoginScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during sign out: $e")),
      );
    }
  }

  // Get the current date
  DateTime now = DateTime.now();

  // Format the date (e.g., "January 11, 2025")
  String formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(235, 53, 66, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Clinic",
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Connect",
              style: TextStyle(
                  fontFamily: 'Kumbh',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 15, 5, 126)),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            tooltip: 'Sign Out',
            onPressed: () {
              // Handle sign-out logic here
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Sign Out'),
                  content: Text('Are you sure you want to sign out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _signOut(context); // NsignOutavigate to login screen
                      },
                      child: Text('Sign Out'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Receptionist Dashboard",
                style: TextStyle(
                    fontFamily: 'Kumbh',
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                width: double.infinity,
                height: 520,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 242, 242, 1),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$formattedDate.',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total Appointments",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Kumbh',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 145,
                          height: 135,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(235, 53, 66, 255),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              "31",
                              style: TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(235, 53, 66, 255))),
                                onPressed: () {},
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ongoing Appointment",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Kumbh',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 145,
                          height: 135,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(235, 53, 66, 255),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              "21",
                              style: TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 52,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(235, 53, 66, 255))),
                                onPressed: () {},
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(235, 53, 66, 255))),
                                onPressed: () {},
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Color.fromARGB(235, 53, 66, 255),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontFamily: 'Kumbh',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Color.fromARGB(235, 53, 66, 255),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    'View Appointments',
                    style: TextStyle(
                        fontFamily: 'Kumbh',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

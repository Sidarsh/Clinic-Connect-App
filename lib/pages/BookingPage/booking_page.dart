import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Fetch patient data from Firestore
  Future<DocumentSnapshot> fetchPatientData() async {
    var patdata = await FirebaseFirestore.instance
        .collection('patients')
        .doc('patient_id')
        .get();
    return patdata;
  }

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Fetch and display patient data
              FutureBuilder<DocumentSnapshot>(
                future: fetchPatientData(), // Fetch patient data from Firestore
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('No data found'));
                  } else {
                    var data = snapshot.data!.data() as Map<String, dynamic>;
                    String name = data['name'] ?? 'Unknown';
                    String age = data['age']?.toString() ?? 'Unknown';
                    String healthStatus = data['healthstat'] ?? 'Unknown';
                    String tokenNo = data['token_no']?.toString() ?? 'Unknown';

                    return Container(
                      margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 5, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(235, 53, 66, 255),
                            width: 2.5),
                      ),
                      width: double.infinity,
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: $name",
                                style: TextStyle(
                                  fontFamily: 'Kumbh',
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Age: $age",
                                style: TextStyle(
                                  fontFamily: 'Kumbh',
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Health Status: $healthStatus",
                                style: TextStyle(
                                  fontFamily: 'Kumbh',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 6),
                              Text("Token No."),
                              SizedBox(height: 5),
                              Text(
                                tokenNo,
                                style: TextStyle(fontSize: 40),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

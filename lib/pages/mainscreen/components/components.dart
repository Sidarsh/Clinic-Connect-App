import 'package:doctor_appointment_app/pages/SearchScreen/search_screen.dart';
import 'package:doctor_appointment_app/pages/SplashScreen/splash_screen.dart';
import 'package:doctor_appointment_app/pages/UserLoginPage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  var sharedPref = await SharedPreferences.getInstance();
  sharedPref.setBool(SplashScreenState.KEYVAL, false);
  sharedPref.remove(SplashScreenState.ROLE); // Clear the role

  // Redirect to the appropriate login screen
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

class TopScreen extends StatelessWidget {
  final List<String> profile = ["Profile", "Appointments", "Sign Out"];
  TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'Kumbh'),
                  ),
                  SizedBox(
                    width: 165,
                  )
                ],
              ),
              Text(
                "Sidarsh Penagonda!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Kumbh'),
              ),
            ],
          ),
          Column(
            children: [
              PopupMenuButton(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(235, 53, 66, 255),
                  icon: Icon(Iconsax.profile_circle),
                  iconSize: 42,
                  onSelected: (value) {
                    if (value == "Sign Out") {
                      signOut(context);
                    }
                  },
                  itemBuilder: (context) {
                    return profile
                        .map((e) => PopupMenuItem(
                            value: e,
                            child: Container(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontFamily: 'Kumbh',
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )))
                        .toList();
                  })
            ],
          )
        ],
      ),
    );
  }
}

// Import GetX package

// Searchbar widget
class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to LoginPage using Get.to()
        Get.to(() => SearchScreen());
      },
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the SearchScreen (or LoginPage) when clicked
            Get.to(() =>
                SearchScreen()); // You can replace LoginPage with your desired screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Button color
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.black)),
          ),
          child: Row(
            children: [
              Icon(Icons.search), // Search icon
              SizedBox(width: 10), // Space between icon and text
              Text('Search Clinics'), // Button label
            ],
          ),
        ),
      ),
    );
  }
}

// SearchScreen widget (new screen to navigate to)

class DoctorSpecBar extends StatelessWidget {
  const DoctorSpecBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DocSpecCard(
              title: "General Physician",
              imagename: 'images/DoctorSpecialist/generalphysician.png'),
          DocSpecCard(
              title: 'Neurologist',
              imagename: 'images/DoctorSpecialist/neurologist.png'),
          DocSpecCard(
              title: 'Orthopedist',
              imagename: 'images/DoctorSpecialist/orthopedist.png'),
          DocSpecCard(title: 'Pediatrics', imagename: 'images/pediatrics.png'),
          DocSpecCard(
              title: 'Cardiologist',
              imagename: 'images/DoctorSpecialist/cardiologist.png'),
          DocSpecCard(
              title: 'Geriatric',
              imagename: 'images/DoctorSpecialist/geriatric.png'),
          DocSpecCard(
              title: 'ENT', imagename: 'images/DoctorSpecialist/ent.png'),
          DocSpecCard(
              title: 'Optometrist',
              imagename: 'images/DoctorSpecialist/eye.png'),
        ],
      ),
    );
  }
}

class DocSpecCard extends StatelessWidget {
  final String title;
  final String imagename;
  const DocSpecCard({super.key, required this.title, required this.imagename});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.2),
            borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagename,
              width: 50,
              height: 50,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Kumbh'),
            )
          ],
        ),
      ),
    );
  }
}

class FeatureSlides extends StatefulWidget {
  const FeatureSlides({super.key});

  @override
  State<FeatureSlides> createState() => _FeatureSlidesState();
}

class _FeatureSlidesState extends State<FeatureSlides> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 250,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentindex = index;
                });
              },
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                    onTap: () {
                      debugPrint("User wants to book an appointment");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        'images/bookappointment.png',
                        width: double.infinity,
                        height: 100,
                        scale: 0.2,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      debugPrint(
                          "User wants to check the current apoointment going on in the nearby clinics.");
                    },
                    child: Image.asset('images/checkappointment.png'))
              ],
            )),
        SizedBox(
          height: 5,
        ),
        OverflowBar(
          children: [
            Icon(
              currentindex == 0 ? Icons.circle : Icons.circle_outlined,
              size: 16.0,
            ),
            Icon(
              currentindex == 1 ? Icons.circle : Icons.circle_outlined,
              size: 16.0,
            )
          ],
        )
      ],
    );
  }
}

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FAQBox(),
            SizedBox(
              width: 10,
            ),
            FAQBox(),
            SizedBox(
              width: 10,
            ),
            FAQBox(),
            SizedBox(
              width: 10,
            ),
            FAQBox()
          ],
        ),
      ),
    );
  }
}

class FAQBox extends StatelessWidget {
  const FAQBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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

class Vision extends StatelessWidget {
  const Vision({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(235, 53, 66, 255),
          borderRadius: BorderRadius.only(topRight: Radius.circular(100.0))),
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "'Our vision is to simplify healthcare access with online appointment booking and real-time updates, ensuring convenience and transparency for all patients.'",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

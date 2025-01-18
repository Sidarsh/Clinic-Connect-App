import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/pages/DocDetailPage/doc_detail.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  late String searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Clinic",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Kumbh',
                    color: Colors.blue),
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
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 50.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Iconsax.search_normal),
                  hintText: 'Search Clinics',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 2.5, color: Color.fromARGB(235, 53, 66, 255))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 2.5, color: Color.fromARGB(235, 53, 66, 255))),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('doctors')
                    .where('name', isGreaterThanOrEqualTo: searchQuery)
                    .where('name', isLessThanOrEqualTo: searchQuery + '\uf8ff')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final doctors = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return ListTile(
                        title: Text(doctor['name']),
                        subtitle: Text(doctor['specialization']),
                        onTap: () {
                          // Navigate to doctor profile screen
                          Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DocDetail(doctor: doctor), // Passing the doctor document data
  ),
);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorProfileScreen extends StatelessWidget {
  final DocumentSnapshot doctor;

  const DoctorProfileScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doctor['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${doctor['name']}'),
            Text('Specialization: ${doctor['specialization']}'),
            // Add more doctor details here
          ],
        ),
      ),
    );
  }
}

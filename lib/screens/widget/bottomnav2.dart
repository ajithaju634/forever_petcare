
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentsAndPetDetailsScreen extends StatefulWidget {
  @override
  _AppointmentsAndPetDetailsScreenState createState() => _AppointmentsAndPetDetailsScreenState();
}

class _AppointmentsAndPetDetailsScreenState extends State<AppointmentsAndPetDetailsScreen> {
  List<Map<String, dynamic>> appointments = [];
  List<Map<String, dynamic>> petDetails = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Fetch appointments
        final appointmentSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (appointmentSnapshot.exists) {
          final data = appointmentSnapshot.data() as Map<String, dynamic>;
          appointments = List<Map<String, dynamic>>.from(data['appointments'] ?? []);
        }

        // Fetch pet details
        final petSnapshot = await FirebaseFirestore.instance
            .collection('petsdetails')
            .where('userid', isEqualTo: user.uid)
            .get();

        petDetails = petSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      } catch (e) {
        print("Error fetching data: $e");
      } finally {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments & Pet Details'),
        backgroundColor: Color.fromARGB(255, 85, 176, 92),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : appointments.isEmpty && petDetails.isEmpty
              ? Center(child: Text('No appointments or pet details found'))
              : ListView.builder(
                  itemCount: appointments.length + petDetails.length,
                  itemBuilder: (context, index) {
                    if (index < appointments.length) {
                      final appointment = appointments[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('Appointment Date: ${appointment['date']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Time: ${appointment['time']}'),
                              Text('Details: ${appointment['details']}'),
                            ],
                          ),
                        ),
                      );
                    } else {
                      final pet = petDetails[index - appointments.length];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('Pet Name: ${pet['name']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Type: ${pet['type']}'),
                              Text('Breed: ${pet['breed']}'),
                              Text('Age: ${pet['age']} years'),
                              Text('Description: ${pet['description']}'),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
    );
  }
}


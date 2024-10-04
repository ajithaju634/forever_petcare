// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AppointmentsScreen extends StatefulWidget {
//   @override
//   _AppointmentsScreenState createState() => _AppointmentsScreenState();
// }

// class _AppointmentsScreenState extends State<AppointmentsScreen> {
//   List<Map<String, dynamic>> appointments = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchAppointments();
//   }

//   Future<void> fetchAppointments() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final snapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         if (snapshot.exists) {
//           final data = snapshot.data() as Map<String, dynamic>;
//           if (data['appointments'] != null) {
//             setState(() {
//               appointments = List<Map<String, dynamic>>.from(data['appointments']);
//             });
//           }
//         }
//       }
//     } catch (e) {
//       print("Error fetching appointments: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('My Appointments')),
//       body: appointments.isEmpty
//           ? Center(child: Text('No appointments found'))
//           : ListView.builder(
//               itemCount: appointments.length,
//               itemBuilder: (context, index) {
//                 final appointment = appointments[index];
//                 return ListTile(
//                   title: Text('Date: ${appointment['date']}'),
//                   subtitle: Text('Time: ${appointment['time']}\nDetails: ${appointment['details']}'),
//                 );
//               },
//             ),
//     );
//   }
// }



// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
// import 'package:petapp/screens/widget/bottomnav2.dart';
// import 'package:petapp/screens/widget/bottomnav3.dart';

// class Doctorappoinment extends StatefulWidget {
//   const Doctorappoinment({super.key});

//   @override
//   State<Doctorappoinment> createState() => _DoctorappoinmentState();
// }

// class _DoctorappoinmentState extends State<Doctorappoinment> {
//   DateTime? _selectedDate;
//   String? _selectedTime;

//   final TextEditingController _detailscontroller = TextEditingController();
//   final TextEditingController emailcontoler = TextEditingController();
//   final TextEditingController usernamecontoler = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color.fromARGB(48, 177, 170, 170),
//         body: Container(
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 80,
//                 ),
//                 Text(
//                   "Book your Appoinment",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Appoinment Booking Date",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       TextButton(
//                           onPressed: () async {
//                             DateTime? pickDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: _selectedDate ?? DateTime.now(),
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime(2100));
//                             if (pickDate != null && pickDate != _selectedDate) {
//                               setState(() {
//                                 _selectedDate = pickDate;
//                               });
//                             }
//                           },
//                           child: Container(
//                             height: 35,
//                             width: 80,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: Colors.black),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   _selectedDate == null
//                                       ? "Pick a Date"
//                                       : DateFormat('yyyy-mm-dd')
//                                           .format(_selectedDate!),
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30, right: 200),
//                   child: Text(
//                     "Slots",
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 110),
//                   child: Row(
//                     children: [
//                       buildTimeSlotButton("10:00"),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       buildTimeSlotButton("11:00"),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       buildTimeSlotButton("12:00"),
//                       SizedBox(
//                         width: 15,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: 350,
//                   child: TextFormField(
//                     controller: emailcontoler,
//                     decoration: InputDecoration(
//                         labelText: "enter email",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Symptoms or Reason for Visit",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       SizedBox(
//                           width: 350,
//                           child: TextField(
//                             controller: _detailscontroller,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                             maxLines: 5,
//                           ))
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                 ),
//                 ElevatedButton(
//                     onPressed: () async {
//                       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Processing")));
//                       if (_selectedDate == null ||
//                           _selectedTime == null ||
//                           _detailscontroller.text.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Please fill out all fields")),
//                         );

//                         return;
//                       }
//                       final name = usernamecontoler.text;
//                       final email = emailcontoler.text;
//                       // final users={
//                       //  'name':name,
//                       //  'email':email,
//                       //  'date':DateFormat("yyy-mm-dd").format(_selectedDate!),
//                       //  'time':_selectedTime,
//                       //  'details':_detailscontroller.text
//                       // };
//                       // await FirebaseFirestore.instance.collection('users').add(users);
//                       // usernamecontoler.clear();
//                       // emailcontoler.clear();

//                       //  final appoinmentdata={
//                       //   'date':DateFormat('yyy-mm-dd').format(_selectedDate!),
//                       //   'time':_selectedTime,
//                       //   "details":_detailscontroller.text

//                       //  };

//                       try {
//                         final user = FirebaseAuth.instance.currentUser;
//                         if (user == null) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                                 content:
//                                     Text('No user is currently signed in')),
//                           );
//                           return;
//                         }

//                         final collection = FirebaseFirestore.instance
//                             .collection('users')
//                             .doc(user.uid)
//                             .collection('users');
//                         await collection.add({
//                           'email': emailcontoler.text,
//                           'date':
//                               DateFormat("yyy-mm-dd").format(_selectedDate!),
//                           'time': _selectedTime,
//                           'details': _detailscontroller.text
//                         });
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               content: Text("Appointment booked successfully")),
//                         );
//                         setState(() {
//                           _selectedDate = null;
//                           _selectedTime = null;
//                           _detailscontroller.clear();
//                         });
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("faild to book appoinment:$e")));
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Color.fromARGB(255, 85, 176, 92)),
//                     child: Text(
//                       "conform Appoinment",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     )),
//                     ElevatedButton(
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => Feedbackscreen()),
//     );
//   },
//   child: Text("View Appointments"),
// ),

//               ],
//             ),
//           ),
//         ));
//   }

//   Widget buildTimeSlotButton(String Time) {
//     return ElevatedButton(
//         onPressed: () {
//           _selectedTime = Time;
//         },
//         child: Text(
//           Time,
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ));
//   }
// }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petapp/screens/dispalydemo.dart';
import 'package:petapp/screens/widget/bottomnav2.dart';
// import 'package:petapp/screens/feedback_screen.dart'; // Update the import path accordingly

class Doctorappoinment extends StatefulWidget {
  const Doctorappoinment({super.key});

  @override
  State<Doctorappoinment> createState() => _DoctorappoinmentState();
}

class _DoctorappoinmentState extends State<Doctorappoinment> {
  DateTime? _selectedDate;
  String? _selectedTime;

  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(48, 177, 170, 170),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              "Book your Appointment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Appointment Booking Date", style: TextStyle(fontWeight: FontWeight.w600)),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickDate != null && pickDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickDate;
                        });
                      }
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          _selectedDate == null ? "Pick a Date" : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 200),
              child: Text("Slots", style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Row(
                children: [
                  buildTimeSlotButton("10:00"),
                  SizedBox(width: 15),
                  buildTimeSlotButton("11:00"),
                  SizedBox(width: 15),
                  buildTimeSlotButton("12:00"),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Symptoms or Reason for Visit", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _detailsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: () async {
                if (_selectedDate == null || _selectedTime == null || _detailsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill out all fields")));
                  return;
                }
                final email = emailController.text;

                try {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user is currently signed in')));
                    return;
                  }

                  // Store appointment data in user's document
                  final appointmentData = {
                    'email': email,
                    'appointments': FieldValue.arrayUnion([{
                      'date': DateFormat("yyyy-MM-dd").format(_selectedDate!),
                      'time': _selectedTime,
                      'details': _detailsController.text,
                    }]),
                  };

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .set(appointmentData, SetOptions(merge: true)); // Use merge to add to existing document

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Appointment booked successfully")));
                  setState(() {
                    _selectedDate = null;
                    _selectedTime = null;
                    _detailsController.clear();
                    emailController.clear();
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to book appointment: $e")));
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 85, 176, 92)),
              child: Text("Confirm Appointment", style: TextStyle(color: Colors.white)),
            ),
           
          ],
        ),
      ),
    );
  }

  Widget buildTimeSlotButton(String time) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedTime = time; // Update selected time and refresh UI
        });
      },
      child: Text(
        time,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

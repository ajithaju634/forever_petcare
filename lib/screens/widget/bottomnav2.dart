// import 'dart:async';
// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:petapp/model/appoinmntmodel.dart';

// class Feedbackscreen extends StatefulWidget {
//   const Feedbackscreen({super.key});

//   @override
//   State<Feedbackscreen> createState() => _FeedbackscreenState();
// }

// class _FeedbackscreenState extends State<Feedbackscreen> {
//   CollectionReference Appoinment =
//       FirebaseFirestore.instance.collection('appoinment');
//   Stream<List<Appointmentmodel>> _appoinment = [];
//   bool _isLoading = true;

//   @override
//   void instance() {
//     super.initState();
//     fetchAppointments();
//   }

//   Future<void> fetchAppointments() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     try {
//       var snapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .collection('appointments')
//           .snapshots();

//       setState(() {
//         _appoinment = snapshot.map((convert) {
//           return convert.docs.map((toElement) {
//             return Appointmentmodel.fromFirestore(toElement.data(), user.uid);
//           }).toList();
//         });
//         // _appoinment = snapshot.docs.map((doc) {
//         //   return doc.data(); // Properly cast to Map
//         // }).toList();
//       });
//     } catch (e) {
//       print("Error fetching appointments: $e");
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Appoinment"),
//       ),
//       //  body: _isLoading
//       //     ? Center(child: CircularProgressIndicator())
//       //     : _appoinment.isEmpty
//       //         ? Center(child: Text("No appointments found."))
//       //         : ListView.builder(
//       //             itemCount: _appoinment.length,
//       //             itemBuilder: (context, index) {
//       //               final appointment = _appoinment[index];
//       //               return ListTile(
//       //                 title: Text("Date: ${appointment.date}"),
//       //                 subtitle: Text("Time: ${appointment.time}\nDetails: ${appointment.details}"),
//       //               );
//       //             },
//       //           ),
//       body: Container(
//           color: const Color.fromARGB(255, 137, 196, 138),
//           child: StreamBuilder<List<Appointmentmodel>>(
//               stream: getTodostream(auth.authInst.currentUser!.uid),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   log("${snapshot.error}");
//                   return Center(
//                     child: Text("there has been one error${snapshot.error}"),
//                   );
//                 }
//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(
//                     child: Text("No user"),
//                   );
//                 }
//                 var appoinmentdata = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: appoinmentdata.length, 
//                   itemBuilder: (context, Index) {
//                   var appoin = appoinmentdata[Index];
//                   return Card(
//                     elevation: 1,
//                     child:InkWell(onTap: () {
                      
//                     },) ,
//                   );
//                 });
//               })),
//     );
//   }
// }
// import 'dart:async';
// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:petapp/model/appoinmntmodel.dart';

// class Feedbackscreen extends StatefulWidget {
//   const Feedbackscreen({super.key});

//   @override
//   State<Feedbackscreen> createState() => _FeedbackscreenState();
// }

// class _FeedbackscreenState extends State<Feedbackscreen> {
//   Stream<List<Appointmentmodel>> _appointmentsStream = Stream.empty();

//   @override
//   void initState() {
//     super.initState();
//     fetchAppointments();
//   }

//   Future<void> fetchAppointments() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//        print("No user is logged in.");
//   return;
//     }
//     print("user ID:${user.uid}");
//     try {
//       _appointmentsStream = FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .collection('appointments')
//           .snapshots()
//           .map((snapshot) {
//         return snapshot.docs.map((doc) {
//           return Appointmentmodel.fromFirestore(doc.data(), user.uid);
//         }).toList();
//       });
//     } catch (e) {
//       log("Error fetching appointments: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Appointments"),
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 137, 196, 138),
//         child: StreamBuilder<List<Appointmentmodel>>(
//           stream: _appointmentsStream,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               log("${snapshot.error}");
//               return Center(child: Text("Error: ${snapshot.error}"));
//             }
//             if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text("No appointments found"));
//             }

//             var appointmentData = snapshot.data!;
//             return ListView.builder(
//               itemCount: appointmentData.length,
//               itemBuilder: (context, index) {
//                 var appointment = appointmentData[index];
//                 return Card(
//                   elevation: 1,
//                   margin: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       // Your onTap logic here
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Date: ${appointment.date}", style: TextStyle(fontSize: 18)),
//                           Text("Time: ${appointment.time}", style: TextStyle(fontSize: 16)),
//                           Text("Details: ${appointment.details}", style: TextStyle(fontSize: 14)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petapp/model/appoinmntmodel.dart';

class Feedbackscreen extends StatefulWidget {
  const Feedbackscreen({super.key});

  @override
  State<Feedbackscreen> createState() => _FeedbackscreenState();
}

class _FeedbackscreenState extends State<Feedbackscreen> {
  late Stream<List<Appointmentmodel>> _appointmentsStream;

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  void fetchAppointments() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("No user is logged in.");
      return;
    }
    print("user ID: ${user.uid}");

    _appointmentsStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('appointments')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Appointmentmodel.fromFirestore(doc.data(), user.uid);
      }).toList();
    }).handleError((error) {
      log("Error fetching appointments: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments"),
      ),
      body: Container(
        color: const Color.fromARGB(255, 137, 196, 138),
        child: StreamBuilder<List<Appointmentmodel>>(
          stream: _appointmentsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No appointments found"),
                    ElevatedButton(
                      onPressed: fetchAppointments,
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            var appointmentData = snapshot.data!;
            return ListView.builder(
              itemCount: appointmentData.length,
              itemBuilder: (context, index) {
                var appointment = appointmentData[index];
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // Navigate to appointment detail or perform other actions
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date: ${appointment.date}", style: TextStyle(fontSize: 18)),
                          Text("Time: ${appointment.time}", style: TextStyle(fontSize: 16)),
                          Text("Details: ${appointment.details}", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


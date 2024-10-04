// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Petdetails extends StatefulWidget {
//   const Petdetails({super.key});

//   @override
//   State<Petdetails> createState() => _PetdetailsState();
// }

// class _PetdetailsState extends State<Petdetails> {
//   final _formKey = GlobalKey<FormState>();

//   // Form field controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _typeController = TextEditingController();
//   final TextEditingController _breedController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   Future<void> _submitform() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       final name = _nameController.text;
//       final Type = _typeController.text;
//       final breed = _breedController.text;
//       final age = _ageController.text;
//       final description = _descriptionController.text;
//       // final User? currentuser=FirebaseAuth.instance.currentUser;
//       // if(currentuser==null)

//       try {
//         await FirebaseFirestore.instance.collection('petsdetails').add({
//           'name': name,
//           'type': Type,
//           'breed': breed,
//           'age': age,
//           'description': description,
//           // 'userid':currentuser!.uid,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Data added successfully')),
//         );
//         _nameController.clear();
//         _typeController.clear();
//         _breedController.clear();
//         _ageController.clear();
//         _descriptionController.clear();
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to add data: $e')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(48, 177, 170, 170),
//       appBar: AppBar(
//         title: Text(
//           'Pet Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Color.fromARGB(46, 244, 241, 241),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                     labelText: 'Pet Name',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the pet\'s name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: _typeController,
//                 decoration: InputDecoration(
//                     labelText: 'Pet Type (e.g., Dog, Cat)',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the pet\'s type';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: _breedController,
//                 decoration: InputDecoration(
//                     labelText: 'Pet Breed',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the pet\'s breed';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: _ageController,
//                 decoration: InputDecoration(
//                     labelText: 'Pet Age',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the pet\'s age';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                     labelText: 'Description',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 maxLines: 3,
//               ),
//               SizedBox(height: 30),
//               SizedBox(
//                 width: 60,
//                 child: ElevatedButton(
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     onPressed: _submitform,
//                     child: Text(
//                       "BOOK NOW",
//                       style: TextStyle(color: Colors.white),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PetDetails extends StatefulWidget {
//   const PetDetails({super.key});

//   @override
//   State<PetDetails> createState() => _PetDetailsState();
// }

// class _PetDetailsState extends State<PetDetails> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _typeController = TextEditingController();
//   final TextEditingController _breedController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _submitForm() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       final name = _nameController.text;
//       final type = _typeController.text;
//       final breed = _breedController.text;
//       final age = _ageController.text;
//       final description = _descriptionController.text;
//       final user = FirebaseAuth.instance.currentUser;

//       setState(() {
//         _isLoading = true; // Start loading
//       });

//       try {
//         await FirebaseFirestore.instance.collection('petsdetails').add({
//           'name': name,
//           'type': type,
//           'breed': breed,
//           'age': age,
//           'description': description,
//           'userid': user?.uid, // Store user ID if logged in
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Data added successfully')),
//         );
//         _formKey.currentState?.reset(); // Reset form fields
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to add data: $e')),
//         );
//       } finally {
//         setState(() {
//           _isLoading = false; // Stop loading
//         });
//       }
//     }
//   }

//   // Method to fetch pet details from Firestore
//   Future<List<Map<String, dynamic>>> fetchPetDetails() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return [];

//     final snapshot = await FirebaseFirestore.instance
//         .collection('petsdetails')
//         .where('userid', isEqualTo: user.uid)
//         .get();

//     return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(48, 177, 170, 170),
//       appBar: AppBar(
//         title: Text(
//           'Pet Details',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Color.fromARGB(46, 244, 241, 241),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Form Fields (omitted for brevity)
//               // ...
//               SizedBox(height: 30),
//               _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : SizedBox(
//                       width: 60,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                         onPressed: _submitForm,
//                         child: Text(
//                           "BOOK NOW",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final type = _typeController.text;
      final breed = _breedController.text;
      final age = _ageController.text;
      final description = _descriptionController.text;
      final user = FirebaseAuth.instance.currentUser;

      setState(() {
        _isLoading = true; // Start loading
      });

      try {
        await FirebaseFirestore.instance.collection('petsdetails').add({
          'name': name,
          'type': type,
          'breed': breed,
          'age': age,
          'description': description,
          'userid': user?.uid, // Store user ID if logged in
          'createdAt': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data added successfully')),
        );
        _formKey.currentState?.reset(); // Reset form fields
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add data: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }
    }
  }

  // Method to fetch pet details from Firestore (if needed)
  Future<List<Map<String, dynamic>>> fetchPetDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('petsdetails')
        .where('userid', isEqualTo: user.uid)
        .get();

    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pet Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Pet Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Pet Type (e.g., Dog, Cat)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: 'Pet Breed'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s breed';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Pet Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number for age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 30),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Add Pet'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}


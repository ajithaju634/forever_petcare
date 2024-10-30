// import 'package:flutter/material.dart';

// class Feedback2 extends StatelessWidget {
//   const Feedback2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
//       appBar: AppBar(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
//         title: Text("Feedback"),centerTitle: true,),
//       body:Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//           Text("Your feedbck"),
//           TextField(maxLines: 5,
//             decoration:InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(15),) 
//            ,fillColor: Colors.grey) ,
//           ),SizedBox(height: 20,),
//           Text("Your email"),
//           TextFormField(
//             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),labelText: "enter your email",),)
//         ,SizedBox(height: 20,)
//             ,Padding(
//               padding: const EdgeInsets.only(left: 110),
//               child: InkWell(onTap: () {
                
//               },
//                 child: TextButton(onPressed: () {
                  
//                 },
//                   child: Container(
//                     width: 250,height: 50,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.greenAccent),
//                     child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                       Text("Submit ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
//                     ],),
//                   ),
//                 ),
//               ),
//             )
//         ],),
//       ) ,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback2 extends StatefulWidget {
  const Feedback2({super.key});

  @override
  _Feedback2State createState() => _Feedback2State();
}

class _Feedback2State extends State<Feedback2> {
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _feedbackController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateFeedback(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your feedback';
    }
    return null;
  }

  void _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      // Handle the submission logic here
      String feedback = _feedbackController.text;
      String email = _emailController.text;

      // Create a new feedback object
      Map<String, dynamic> feedbackData = {
        'feedback': feedback,
        'email': email,
        'timestamp': FieldValue.serverTimestamp(),
      };

      // Add feedback to Firestore
      try {
        await FirebaseFirestore.instance.collection('feedback').add(feedbackData);
        print('Feedback submitted successfully');

        // Clear the fields after submission
        _feedbackController.clear();
        _emailController.clear();
      } catch (e) {
        print('Error submitting feedback: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(48, 177, 170, 170),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 176, 92),
        title: Text("Feedback"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Feedback"),
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: Colors.grey[300],
                  hintText: 'Enter your feedback',
                ),
                validator: _validateFeedback,
              ),
              SizedBox(height: 20),
              Text("Your Email"),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your email",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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


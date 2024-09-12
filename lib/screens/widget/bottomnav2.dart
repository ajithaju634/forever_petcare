import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Feedbackscreen extends StatefulWidget {
  const Feedbackscreen({super.key});

  @override
  State<Feedbackscreen> createState() => _FeedbackscreenState();
}

class _FeedbackscreenState extends State<Feedbackscreen> {
  CollectionReference Appoinment=FirebaseFirestore.instance.collection('appoinment');
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appoinment"),),
     
    );
  }
}
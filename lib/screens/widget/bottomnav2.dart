import 'package:flutter/material.dart';

class Feedbackscreen extends StatefulWidget {
  const Feedbackscreen({super.key});

  @override
  State<Feedbackscreen> createState() => _FeedbackscreenState();
}

class _FeedbackscreenState extends State<Feedbackscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appoinment"),),
     
    );
  }
}
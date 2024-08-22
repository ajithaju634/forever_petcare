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
      body: Center(
        child: Column(children: [SizedBox(height: 50,),
          Text("Your Appoinments",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],),
      ),
    );
  }
}
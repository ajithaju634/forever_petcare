import 'package:flutter/material.dart';

class Appoiments extends StatefulWidget {
  const Appoiments({super.key});

  @override
  State<Appoiments> createState() => _AppoimentsState();
}

class _AppoimentsState extends State<Appoiments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [SizedBox(height: 50,),
          Text("feedback",style: TextStyle(fontSize: 20),)],),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:petapp/screens/Adopt/adoptscreen2.dart';
import 'package:petapp/screens/Adopt/splashscreen.dart';
import 'package:petapp/screens/Grooming/grooming1.dart';
import 'package:petapp/screens/home.dart';
import 'package:petapp/screens/petdetails.dart';
import 'package:petapp/screens/splash.screen.dart';
import 'package:petapp/screens/training.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Petdetails()
    );
  }
}



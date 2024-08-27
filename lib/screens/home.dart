import 'package:flutter/material.dart';


import 'package:petapp/screens/widget/bottomnav1.dart';
import 'package:petapp/screens/widget/bottomnav2.dart';
import 'package:petapp/screens/widget/bottomnav3.dart';
import 'package:petapp/screens/widget/bottomnav4.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexNum=0;
  List<Widget>tabwidgets=[
    Homescreen(),
    Feedbackscreen(),
    Appoiments(),
    Profilecreen()
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(
       Icons.home ),label: "Home",backgroundColor: Colors.grey),
       BottomNavigationBarItem(icon: Icon(Icons.calendar_month_sharp),label: "Appoinments",backgroundColor: Colors.grey),
       BottomNavigationBarItem(icon: Icon(Icons.feedback),label: "feedback"),
       BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: "Profile")],
       currentIndex: indexNum,
       onTap: (int index) {
        setState(() {
          indexNum=index;
        });
        
       },
       ),

      backgroundColor: const Color.fromARGB(255, 235, 229, 229),
    
      body:tabwidgets[indexNum],
    );
  }
}
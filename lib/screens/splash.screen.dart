import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petapp/screens/home.dart';

class Splashscreen extends StatefulWidget {
   Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  
  Widget build(BuildContext context) {
  void  initState(){
      super.initState();
      Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home())));
    }
    
    return Scaffold(backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 180,),
          Column(
            children: [
              Center(child: Text("FOREVER",style: TextStyle(fontSize: 60,color:Color.fromRGBO(81, 55, 55,5) ),)),
              
            ],
          ),
          Text("Nuture.Prote.Love.Heal\n              Pet Care",style: TextStyle(fontWeight: FontWeight.w600),),
          Container(height: 300,
          width: 500,
          child: Image(image: AssetImage("asset/Rectangle 35.png")),)

        ],

      ),
    );
  }
}
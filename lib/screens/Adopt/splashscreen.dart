import 'package:flutter/material.dart';

class Adoptsplashscreen extends StatelessWidget {
  const Adoptsplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(185, 94, 193, 196),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
               children: [SizedBox(height: 130,),
                Text("Make A New Friend",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w600),),
                Text("Adopt A Pet Today",style: TextStyle(color: Colors.white,fontSize: 20),),
                SizedBox(height: 50,),
                Column(children: [
                  CircleAvatar(radius: 200,)
                ],)
               ],
          ),
        ),
      ),
    );
  }
}
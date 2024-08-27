import 'package:flutter/material.dart';
import 'package:petapp/screens/Grooming/grooming1.dart';
import 'package:petapp/screens/petdetails.dart';

class Services extends StatelessWidget {
   Services({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(backgroundColor:Color.fromARGB(48, 177, 170, 170) ,
    appBar: AppBar(title: Text("",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
    backgroundColor:Color.fromARGB(46, 244, 241, 241) ,
    ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(children: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
              },
                child: Container(height: 60,width: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [SizedBox(width: 20,),
                    CircleAvatar(backgroundImage: AssetImage("asset/Rectangle 22.png"),),Text("   Vaccination")],),),
              ),
              SizedBox(height: 30,),
               
               TextButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
               },
                 child: Container(height: 60,width: 250,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                            child: Row(children: [
                             SizedBox(width: 20,),
                    CircleAvatar(backgroundImage: AssetImage("asset/train.jfif"),),Text("   Trainig")
                            ],), ),
               ),
            
              SizedBox(height: 30,),
            
               TextButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Grooming1()));
               },
                 child: Container(height: 60,width: 250,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                             child: Row(children: [
                  SizedBox(width: 20,),
                    CircleAvatar(backgroundImage: AssetImage("asset/grooming.jfif"),),Text("   Grooming")
                             ],),),
               ),
              SizedBox(height: 30,),
            
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
              },
                child: Container(height: 60,width: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                child: Row(children: [
                  SizedBox(width: 20,),
                    CircleAvatar(backgroundImage: AssetImage("asset/Rectangle 23.png"),),Text("   Dentisty & teeth cleaning ")
                ],),),
              ),
              SizedBox(height: 30,)
            ],),
          ),
        ),
      ),
    );
  }
}
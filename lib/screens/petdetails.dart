import 'package:flutter/material.dart';

class Petdetails extends StatelessWidget {
  const Petdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text("Pet Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("What type of pet",style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Row(children: [
                Container(width: 70,height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all()),),SizedBox(width: 10,),
                  Container(width: 70,height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all()),)
              ],),SizedBox(height: 10,),
              Text("Breed of your pet"),
              Row(children: [
                Container(width: 200,height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all()),),SizedBox(width: 10,),
                 
              ],)

              
            ],)
        
        
          ],
        ),
      ),
    );
  }
}
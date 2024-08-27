import 'package:flutter/material.dart';

class Doctorappoinment extends StatelessWidget {
  const Doctorappoinment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
      body: Container(
        child: Center(
          child: Column(children: [
            SizedBox(height: 80,),
            Text("Book your Appoinment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Appoinment Booking Date",style: TextStyle(fontWeight: FontWeight.w600),),TextButton(
                    onPressed: () {
                      
                    },
                    child: Container(height: 35,width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Pick a Date",style: TextStyle(fontSize:12,fontWeight: FontWeight.w600, color: Colors.white),)],),))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 200),
              child: Text("Slots",style: TextStyle(fontWeight:FontWeight.w600),),
            ),SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(children: [
                ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 225, 228, 229)
                ),
                 child: Text("10:00 AM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),SizedBox(width: 15,),
          
                ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 225, 228, 229)
                ),
                 child: Text("12:00 AM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),SizedBox(width: 15,),
                 
          
                ElevatedButton(onPressed: (){},
                style:ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 225, 228, 229) ) , child: Text("2:00 PM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                
                
              ],
              
              ),
              
            ),Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Symptoms or Reason for Visit",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(width: 350,
                    child: TextField(decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)) ),
                    maxLines: 5,))
                ],
              ),
            ),
            SizedBox(height: 35,),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Processing")));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 85, 176, 92)), child: Text("conform Appoinment",style:TextStyle(color: Colors.white,) ,))
            
          ],),
        ),
        
      )
    );
  }
}
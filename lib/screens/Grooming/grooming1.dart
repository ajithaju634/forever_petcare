import 'package:flutter/material.dart';

class Grooming1 extends StatelessWidget {
  const Grooming1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color.fromARGB(48, 177, 170, 170) ,
      body: Center(
        child: Column(
          children: [
          
            Stack(
              children:<Widget>[ CircleAvatar(),
                Container(width: double.infinity,height: 300,
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.grey,
              spreadRadius: 7,blurRadius: 10)]),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCURuN2-Ew1Tm4NLeMYkAFjivvXks3zVavKg&s",fit: BoxFit.fill,),
              ),]
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200,top: 30),
              child: Text("Your pet deserves ",style: TextStyle(fontWeight: FontWeight.w600,
              fontSize: 20,color: Color.fromARGB(236, 123, 99, 90)),),
            ),
             Padding(
               padding: const EdgeInsets.only(right: 10),
               child: Text("THE BEST CARE ",style: TextStyle(fontWeight: FontWeight.w600,
                           fontSize: 40,color: Color.fromRGBO(88, 122, 50, 0.744)),),
             ),
             Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(backgroundColor: Color.fromRGBO(255, 235, 59, 1),
                        child: Icon(Icons.bathtub_outlined),),Text("   Certified Full Grooming",style: TextStyle(color: Color.fromRGBO(14, 21, 5, 0.741)),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      CircleAvatar(backgroundColor: Colors.redAccent,
                      child: Icon(Icons.pets_sharp,color: Color.fromARGB(156, 0, 0, 0),),),
                      Text("  Deshedding,Medicated Bath,\n  Anti Tick Treatment",style: TextStyle(color: Color.fromRGBO(14, 21, 5, 0.741)))
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      CircleAvatar(backgroundColor: Colors.blueAccent,),
                      Text("  Ear Cleaning,Nail Trim,Bathing",style: TextStyle(color: Color.fromRGBO(14, 21, 5, 0.741)))
                    ],),
                  )
                ],
               ),
             ),
             ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.green) ,
              onPressed:(){
                
              }, child: Text("BOOK NOW",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
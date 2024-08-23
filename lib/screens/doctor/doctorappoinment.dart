import 'package:flutter/material.dart';

class Doctorappoinment extends StatelessWidget {
  const Doctorappoinment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(height: 450,width: 450,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(198, 157, 179, 190)),
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
                padding: const EdgeInsets.only(left: 50),
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
              ),SizedBox(height: 35,),
              ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Processing")));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 244, 112, 60)), child: Text("conform Appoinment",style:TextStyle(color: Colors.white,) ,))
              
            ],),
          ),
        ),
        
      )
    );
  }
}
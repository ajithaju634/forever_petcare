import 'package:flutter/material.dart';

class Feedback2 extends StatelessWidget {
  const Feedback2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
      appBar: AppBar(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
        title: Text("Feedback"),centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Your feedbck"),
          TextField(maxLines: 5,
            decoration:InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(15),) 
           ,fillColor: Colors.grey) ,
          ),SizedBox(height: 20,),
          Text("Your email"),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),labelText: "enter your email",),)
        ,SizedBox(height: 20,)
            ,Padding(
              padding: const EdgeInsets.only(left: 110),
              child: InkWell(onTap: () {
                
              },
                child: Container(
                  width: 250,height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.greenAccent),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Submit ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                  ],),
                ),
              ),
            )
        ],),
      ) ,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:petapp/screens/feedback2.dart';

class Appoiments extends StatefulWidget {
  const Appoiments({super.key});

  @override
  State<Appoiments> createState() => _AppoimentsState();
}

class _AppoimentsState extends State<Appoiments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(48, 177, 170, 170)  ,
      appBar: AppBar(title: Text("Feedback"),
      backgroundColor: Color.fromARGB(48, 177, 170, 170) , ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          
            children: [
            Text("User Feedback",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold) ,)
            ,SizedBox(height: 20,),
            SizedBox(width: 400,
              child: Text("We value your feedback and strive to improve our services \nbased on your suggestions. Please provide detailed feedback to help us understand your experience better. Your input is crucial in helping us enhance our app and provide a better user experience.",
              style: TextStyle(fontSize: 14,),),
            ),SizedBox(height: 20,)
            ,InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedback2()));
            },
              child: Container(
                width: 250,height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.greenAccent),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Submit Feedback",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                ],),
              ),
            )
          ],),
        ),
      ),
    );
  }
}
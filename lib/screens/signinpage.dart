import 'package:flutter/material.dart';
import 'package:petapp/screens/home.dart';

class Signinpage extends StatelessWidget {
  const Signinpage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body:Container(
        
        child: Column(children: [SizedBox(height: 110,),
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Text("Hello Again",style:TextStyle(fontSize: 40,fontWeight:FontWeight.w600) ,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Text("Welcome Back You've \nBeen Missed",style: TextStyle(fontSize: 20),),
          ),SizedBox(height: 40,),
          Center(
            child: Column(children: [
               SizedBox(width:349 ,
               height:53 ,
                 child: TextFormField(
                   decoration: InputDecoration(labelText: "Email",
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                   ),
                 ),
               ),SizedBox(height: 50,) ,SizedBox(width: 349,height: 53,
                 child: TextFormField(
                   decoration: InputDecoration(labelText: "Password",
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                   ),
                 ),
               ),
              SizedBox(height: 40,),
              TextButton(onPressed: () {
                
              },
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                  child: Container(height: 45,width: 178,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 122, 211, 125)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Sign in",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold ,color: Colors.white),)],),),
                ),
              )
            ],),
          )
        ],),
      ) ,
    );
  }
}
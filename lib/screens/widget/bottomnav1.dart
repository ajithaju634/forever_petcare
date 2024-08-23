import 'package:flutter/material.dart';
import 'package:petapp/screens/Adopt/splashscreen.dart';
import 'package:petapp/screens/doctor/doctorappoinment.dart';
import 'package:petapp/screens/services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      

      backgroundColor: const Color.fromARGB(255, 235, 229, 229),
    
      body:SingleChildScrollView(
        child: Column(
          children: [Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRULfjmLzq86ePpxgqXZiqq9XbZe7fchdrG8g&s"),
                ),
              )
            ],
          ),
          Container(
            width: 352,
            height: 121,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                  width:146 ,
                  height: 93,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
              child: Image(image: AssetImage("asset/image 1 (1).png")),
                )
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Services()));
                    },
                      child: Container(width: 352,height: 141,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black,
                      image: DecorationImage(image: ExactAssetImage("asset/service.jfif"),fit: BoxFit.fill)),
                       
                      ),
                    ),
                    Text("",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),SizedBox(width: 30,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Adoptsplashscreen()));
                    },
                      child: Container(width: 352,height: 141,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: ExactAssetImage("asset/adopt.jfif",),fit: BoxFit.fill)),
                       
                      ),
                    ),
                    Text("",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),SizedBox(height: 20,),
                InkWell(onTap: () {
                  
                },
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 352,height: 141,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black,
                      image: DecorationImage(image: ExactAssetImage("asset/products.jfif"),fit: BoxFit.fill)),
                      
                      ),
                      Text("",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),SizedBox(width: 30,),
                
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctorappoinment()));
                    },
                      child: Container(width: 352,height: 141,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: ExactAssetImage("asset/doctor.jfif"),fit: BoxFit.fill)),
                      
                      ),
                    ),
                    Text("",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),
          )
          ],
        ),
      )
    );
  }
}
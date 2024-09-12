import 'package:flutter/material.dart';
import 'package:petapp/screens/Adopt/adoptscreen2.dart';
import 'package:petapp/screens/Adopt/splashscreen.dart';
import 'package:petapp/screens/doctor/doctorappoinment.dart';
import 'package:petapp/screens/products.dart/petcare.products.dart';
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
   
      

      backgroundColor: Color.fromARGB(48, 177, 170, 170),
    
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [SizedBox(height: 40,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
               
              ],
            ),
            Container(
              width: 352,
              height: 121,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("    Where there is love for\n animal there is love for life",style: TextStyle(color: Colors.white),),
                  Container(
                    width:146 ,
                    height: 93,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 208, 94, 94)),
                child: Image(image: AssetImage("asset/image 1 (1).png")),
                  )
                ],),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Services()));
                  },
                    child: Stack(
                      children: [Container(width: 352,height: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black,
                      image: DecorationImage(image: ExactAssetImage("asset/service.jfif"),fit: BoxFit.fill)),
                       
                      ),
                       Padding(
                         padding: const EdgeInsets.all(30.0),
                         child: Container(width: 100,height: 30,alignment: Alignment.centerLeft,
                         child:Text("Services",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),) ,),
                       ),
                ]),
                  ),
                  Text("",style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 30,),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Adoptscreen3()));
                  },
                    child: Stack(
                      children: [
                        Container(width: 352,height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: ExactAssetImage("asset/adopt.jfif",),fit: BoxFit.fill)),
                         
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: Text("Adopt",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),),
                        )
                      ],
                    ),
                  ),SizedBox(height: 20,),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Petcareproducts()));
                  },
                    child: Stack(
                      children: [
                        Container(width: 352,height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black,
                        image: DecorationImage(image: ExactAssetImage("asset/products.jfif"),fit: BoxFit.fill)),
                        
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: Text("Product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),),
                        )
                      ],
                    ),
                  ),SizedBox(height: 30,),
                  
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctorappoinment()));
                  },
                    child: Stack(
                      children: [
                        Container(width: 352,height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: ExactAssetImage("asset/doctor.jfif"),fit: BoxFit.fill)),
                        
                        ),
                         Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(child: Text("Doctor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
            ],
          ),
        ),
      )
    );
  }
}
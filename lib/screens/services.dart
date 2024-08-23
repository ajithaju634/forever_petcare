import 'package:flutter/material.dart';
import 'package:petapp/screens/Grooming/grooming1.dart';
import 'package:petapp/screens/petdetails.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(backgroundColor:Color.fromARGB(48, 177, 170, 170) ,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [SizedBox(height: 40,),
              Text("Services",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Grooming1()));
                       },
                         child: Container(width: 171,height: 171,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.black,
                         image: DecorationImage(image: ExactAssetImage("asset/grooming.jfif",),fit: BoxFit.fill)),
                         
                         ),
                       ),
                       Text("Grooming",style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   ),
                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
                       },
                         child: Container(width: 171,height: 171,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.black,
                         image: DecorationImage(image: ExactAssetImage("asset/train.jfif",),fit: BoxFit.fill)),
                         
                         ),
                       ),
                     Text("Trainig",style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   ),
                   
               
                 ],
               ),
               SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
                       },
                         child: Container(width: 171,height: 171,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.black,
                         image: DecorationImage(image: ExactAssetImage("asset/Rectangle 23.png",),fit: BoxFit.fill)),
                         
                         ),
                       ),
                       Text("          Dentistry & \nTeeth Cleanings pets",style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   ),
                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
                       },
                         child: Container(width: 171,height: 171,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.black,
                         image: DecorationImage(image: ExactAssetImage("asset/Rectangle 22.png",),fit: BoxFit.fill)),
                         
                         ),
                       ),
                     Text("Vaccinations",style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   ),
                   
               
                 ],
               ),SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Petdetails()));
                       },
                         child: Container(width: 171,height: 171,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.black,
                         image: DecorationImage(image: ExactAssetImage("asset/Rectangle 32.png",),fit: BoxFit.fill)),
                         
                         ),
                       ),
                       Text("Urgent Care & Emergencies",style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   ),
                   Column(crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Grooming1()));
                       },
                         child: Container(width: 171,height: 171,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.black,
                         image: DecorationImage(image: ExactAssetImage("",),fit: BoxFit.fill)),
                         
                         ),
                       ),
                     Text("",style: TextStyle(fontWeight: FontWeight.bold),)
                     ],
                   ),
                   
               
                 ],
               )
              ],
          ),
        ),
      ),
    );
  }
}
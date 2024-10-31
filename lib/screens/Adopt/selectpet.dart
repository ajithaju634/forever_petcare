// import 'package:flutter/material.dart';
// import 'package:petapp/screens/Adopt/adoptscreen2.dart';

// class Selectpet extends StatelessWidget {
//   const Selectpet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Scaffold(
//         body: SizedBox(
//         width:  double.infinity,
//         height: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: GridView.builder(itemCount: 10,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,childAspectRatio: 2,mainAxisSpacing: 2,crossAxisSpacing: 2)
//           , itemBuilder: (context,indext){
//             return InkWell(onTap: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>Adoptscreen3()));
//             },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 50,top: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(height:192 ,width: 186,
//                       child: Image.asset("asset/Rectangle 103.png",fit: BoxFit.fill,),),
//                       Container(height:192 ,width: 186,
//                         color:Color.fromARGB(185, 94, 193, 196),
//                          child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text("Lisa    :    Female",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text("Coat    :    Long",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text("age    :    5 year",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
//                             ),
//                           ],),
//                         ),
                        
//                       )
//                       ],
//                     )
                    
                    
//                   ],
//                 ),
//               ),
//             );
           
//           }),
//         ),
//             )
         
//         ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petapp/screens/Adopt/adoptscreen2.dart';

class Selectpet extends StatelessWidget {
  const Selectpet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Pet'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Petdetails").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
      
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
      
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No pets available"));
            }
      
            final pets = snapshot.data!.docs;
      
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: GridView.builder(
                  itemCount: pets.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust the number of columns as needed
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final pet = pets[index].data() as Map<String, dynamic>;
                
                    return InkWell(
                      onTap: () {
                        // Navigate to detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Adoptscreen3(pet: pet) // Update with actual detail screen
                          ),
                        );
                      },
                      child: Center(
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        
                                        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(pet['image'] ?? ''))),
                                      ),SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name: ${pet['name']}",
                                              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                            ),
                                            Text("Gender: ${pet['Gender']}"),
                                            Text("Age: ${pet['Age']} years"),
                                            Text("Coat: ${pet['Coat']}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

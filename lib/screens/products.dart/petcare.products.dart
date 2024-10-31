// import 'package:flutter/material.dart';
// import 'package:petapp/model/productds.dart';
// import 'package:petapp/screens/products.dart/payment.dart';

// class Petcareproducts extends StatelessWidget {
//   const Petcareproducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Pet Care Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//       ),),
//       body: Scaffold(
//         body: SizedBox(
//         width:  double.infinity,
//         height: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: GridView.builder(itemCount: 10,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,childAspectRatio: 2,mainAxisSpacing: 1,crossAxisSpacing: 5)
//           , itemBuilder: (context,indext){
//             return InkWell(onTap: () {
//               // final Product = Product(imageUrl: imageUrl, name: "ruber ball", price: 9.99);
//               // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(product: Product,)));
//             },
//               child: Column(
//                 children: [
//                   Container(height: 50,width: 200,
//                   decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage("asset/Frame.png"))),),
//                   Text("Rubber Ball "),SizedBox(width: 75,
//                     child: Row(
                                     
//                       children: [
//                       Text("4.1",style: TextStyle(fontSize: 12),),Icon(Icons.star_purple500_outlined,size: 15,color: Colors.grey,)
//                     ],),
//                   ),
                  
                  
//                 ],
//               ),
//             );
           
//           }),
//         ),
//             )
         
//         ),
//       );
    
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:petapp/model/productds.dart'; // Ensure the correct import path
// import 'package:petapp/screens/products.dart/payment.dart';

// class Petcareproducts extends StatelessWidget {
//   const Petcareproducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Pet Care Products",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('Products').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }

//           final products = snapshot.data!.docs;

//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: GridView.builder(
//               itemCount: products.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 final productData = products[index].data() as Map<String, dynamic>;

//                 // Convert String to double
//                 final double price = double.tryParse(productData['price'].toString()) ?? 0.0;
//                 final double rating = double.tryParse(productData['    rating'].toString()) ?? 0.0;

//                 final product = Product(
//                   imageUrl: productData['image'],
//                   name: productData['name'],
//                   price: price,
//                   rating: rating,
//                 );

//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PaymentPage(product: product),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     elevation: 5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.network(
//                           product.imageUrl,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             product.name,
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               rating.toString(),
//                               style: TextStyle(fontSize: 12),
//                             ),
//                             Icon(
//                               Icons.star,
//                               size: 15,
//                               color: Colors.amber,
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "\$${price.toStringAsFixed(2)}", // Format price to 2 decimal places
//                             style: TextStyle(fontSize: 14, color: Colors.green),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// Sample Product model

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petapp/model/productds.dart'; // Ensure the correct import path
import 'package:petapp/screens/products.dart/payment.dart';

class Petcareproducts extends StatelessWidget {
  const Petcareproducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pet Care Products",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final products = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final productData = products[index].data() as Map<String, dynamic>;

                // Convert String to double
                final double price = double.tryParse(productData['price'].toString()) ?? 0.0;
                final double rating = double.tryParse(productData['rating'].toString()) ?? 0.0;
                
                 print('Image URL: ${productData['image']}');

                    print('[[[[[[[[[]]]]]]]]]');
                final product = Product(
                  imageUrl: productData['image'],
                  name: productData['name'],
                  price: price,
                  // rating: rating,
                );
                print(product.imageUrl.isNotEmpty);
                return InkWell(
                  onTap: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(product: product, productName: '', productImage: '', productPrice: price,),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50,bottom: 25),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left:16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Container(height: 100,width: 100, 
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(product.imageUrl.isNotEmpty ? product.imageUrl : 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png'))
                            ),
                            
                                      ),
                                       Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  child: Text(
                                    product.name,
                                    style: TextStyle(overflow: TextOverflow.visible,fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "\$${price.toStringAsFixed(2)}", // Format price to 2 decimal places
                                  style: TextStyle(fontSize: 14, color: Colors.green),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                            
                  // child: Card(
                  //   elevation: 5,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //         Container(
                  //           height: 100, 
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               image: NetworkImage(
                  //                 product.imageUrl.isNotEmpty ? product.imageUrl : 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png', // Fallback image
                  //               ),
                  //               fit: BoxFit.contain,
                  //             ),
                  //           ),
                  //         ),

                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //           product.name,
                  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       Row(
                  //         children: [
                  //           Text(
                  //             rating.toString(),
                  //             style: TextStyle(fontSize: 12),
                  //           ),
                  //           Icon(
                  //             Icons.star,
                  //             size: 15,
                  //             color: Colors.amber,
                  //           ),
                  //         ],
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //           "\$${price.toStringAsFixed(2)}", // Format price to 2 decimal places
                  //           style: TextStyle(fontSize: 14, color: Colors.green),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


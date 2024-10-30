// import 'package:flutter/material.dart';

// class Paymentpage extends StatelessWidget {
//   const Paymentpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        
//           children: [SizedBox(height: 60,),
//             Text("Oder Summary",style: TextStyle(fontSize: 20),),
//             Card(
//               child: Container(width: 400,height: 200,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Oder Details")
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 55),
//               child: Row(
//                 children: [
//                 Text("Payment Options"),
                

//               ],),
//             ),
           
//             Padding(
//               padding: const EdgeInsets.only(right: 300),
//               child: Container(width: 100,height: 30,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color.fromARGB(183, 232, 229, 229)),
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [Text(""),Text("Gpay")],),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:petapp/model/productds.dart';

// class PaymentPage extends StatelessWidget {
//   final Product product;

//   const PaymentPage({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(product.imageUrl, height: 150),
//             const SizedBox(height: 20),
//             Text(
//               product.name,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: const TextStyle(fontSize: 20, color: Colors.green),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement payment logic here
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Payment processed!')),
//                 );
//               },
//               child: const Text('Pay Now'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:petapp/model/productds.dart';
import 'package:petapp/model/productds.dart'; // Adjust the import as necessary

class PaymentPage extends StatefulWidget {
  final Product product;

  const PaymentPage({Key? key, required this.product, required String productName, required String productImage, required double productPrice}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Calculate total price based on quantity
    double totalPrice = widget.product.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.network(
                widget.product.imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Product Name
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Total Price
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}', // Update total price
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            // Quantity Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Payment Options
            Text(
              'Payment Options:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Example payment options
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit/Debit Card'),
              onTap: () {
                // Handle card payment
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Google Pay'),
              onTap: () {
                // Handle Google Pay
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Cash on Delivery'),
              onTap: () {
                // Handle cash payment
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement payment processing
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Payment Successful'),
                        content: Text('Thank you for your purchase!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Proceed to Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

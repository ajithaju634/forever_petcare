import 'package:flutter/material.dart';
import 'package:petapp/screens/loginpage.dart';
import 'package:petapp/screens/products.dart/payment.dart';
import 'package:petapp/screens/products.dart/petcare.products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  get products => null;
  
  get shippingCost => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Loginpage()
    );
  }
}



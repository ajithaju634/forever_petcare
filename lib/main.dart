import 'package:flutter/material.dart';
import 'package:petapp/admin/imageup.dart';
import 'package:petapp/admin/productdetailsadd.dart';
import 'package:petapp/firebase_options.dart';
import 'package:petapp/screens/Adopt/selectpet.dart';
import 'package:petapp/screens/doctor/doctorappoinment.dart';
import 'package:petapp/screens/home.dart';
import 'package:petapp/screens/imageupload.dart';
import 'package:petapp/screens/loginpage.dart';
import 'package:petapp/screens/petdetails.dart';
import 'package:petapp/screens/products.dart/payment.dart';
import 'package:petapp/screens/products.dart/petcare.products.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petapp/screens/signinpage.dart';
import 'package:petapp/screens/widget/bottomnav1.dart';
import 'package:petapp/screens/widget/bottomnav3.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: 
     Loginpage());
  }
}

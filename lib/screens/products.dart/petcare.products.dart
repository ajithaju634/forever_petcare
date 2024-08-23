import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Petcareproducts extends StatelessWidget {
  const Petcareproducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pet Care Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      ),),
      body: Scaffold(
        body: Column(
          children: [
            Row(children: [

            ],),
            Column(
              children: [
                Row(
                  children: [
                 Card( 
                  child: Column(children: [Container(height:100,width: 80,
                  color:Colors.black12 , )],),
                 )
                ],),
              ],
            )
          ],
        ),
      ),
    );
  }
}
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
        body: SizedBox(
        width:  double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2,mainAxisSpacing: 10,crossAxisSpacing: 5)
          , itemBuilder: (context,indext){
            return Column(
              children: [
                Container(height: 50,width: 100,
                decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage("asset/Frame.png"))),),
                Text(""),Text("")
              ],
            );
          }),
        ),
            )
         
        ),
      );
    
  }
}
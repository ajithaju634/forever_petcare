import 'package:flutter/material.dart';
import 'package:petapp/screens/products.dart/payment.dart';

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
          child: GridView.builder(itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: 2,mainAxisSpacing: 1,crossAxisSpacing: 5)
          , itemBuilder: (context,indext){
            return InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Paymentpage()));
            },
              child: Column(
                children: [
                  Container(height: 50,width: 200,
                  decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage("asset/Frame.png"))),),
                  Text("Rubber Ball "),SizedBox(width: 75,
                    child: Row(
                                     
                      children: [
                      Text("4.1",style: TextStyle(fontSize: 12),),Icon(Icons.star_purple500_outlined,size: 15,color: Colors.grey,)
                    ],),
                  ),
                  
                  
                ],
              ),
            );
           
          }),
        ),
            )
         
        ),
      );
    
  }
}
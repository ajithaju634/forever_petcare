import 'package:flutter/material.dart';

class Paymentpage extends StatelessWidget {
  const Paymentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [SizedBox(height: 60,),
            Text("Oder Summary",style: TextStyle(fontSize: 20),),
            Card(
              child: Container(width: 400,height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Oder Details")
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: Row(
                children: [
                Text("Payment Options"),
                

              ],),
            ),
           
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Container(width: 100,height: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color.fromARGB(183, 232, 229, 229)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(""),Text("Gpay")],),
              ),
            )
          ],
        ),
      ),
    );
  }
}

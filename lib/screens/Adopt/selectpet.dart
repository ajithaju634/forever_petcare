import 'package:flutter/material.dart';
import 'package:petapp/screens/Adopt/adoptscreen2.dart';

class Selectpet extends StatelessWidget {
  const Selectpet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Scaffold(
        body: SizedBox(
        width:  double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,childAspectRatio: 2,mainAxisSpacing: 2,crossAxisSpacing: 2)
          , itemBuilder: (context,indext){
            return InkWell(onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Adoptscreen3()));
            },
              child: Padding(
                padding: const EdgeInsets.only(left: 50,top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(height:192 ,width: 186,
                      child: Image.asset("asset/Rectangle 103.png",fit: BoxFit.fill,),),
                      Container(height:192 ,width: 186,
                        color:Color.fromARGB(185, 94, 193, 196),
                         child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Lisa    :    Female",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Coat    :    Long",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("age    :    5 year",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          ],),
                        ),
                        
                      )
                      ],
                    )
                    
                    
                  ],
                ),
              ),
            );
           
          }),
        ),
            )
         
        ),
    );
  }
}
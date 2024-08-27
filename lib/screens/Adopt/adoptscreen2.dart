import 'package:flutter/material.dart';

class Adoptscreen2 extends StatelessWidget {
  const Adoptscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(48, 177, 170, 170),
    
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top:50,left: 60),
                child: Row(
                  children: [
                    InkWell(onTap: () {
                      
                    },
                      child: Container(height: 45,width: 80, 
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Color.fromARGB(185, 94, 193, 196)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Dog",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)],),),
                    ),SizedBox(width: 20,),
                    InkWell(onTap: () {
                      
                    },
                      child: Container(height: 45,width: 80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Color.fromARGB(185, 94, 193, 196)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Cat",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)],),
                      ),
                    ),SizedBox(width: 20,),
                    InkWell(onTap: () {
                      
                    },
                      child: Container(height: 45,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Color.fromARGB(185, 94, 193, 196)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Bird",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)],),),
                    ),SizedBox(width: 20,),
                    InkWell(onTap: () {
                      
                    },
                      child: Container(height: 45,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Color.fromARGB(185, 94, 193, 196)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Other",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)],), ),
                    ),SizedBox(width: 15,),
                  ],
                ),
              ),SizedBox(height: 60,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height:192 ,width: 186,
                    child: Image.asset("asset/Rectangle 102.png",),),
                    Container(height:192 ,width: 186,
                      color:Color.fromARGB(185, 94, 193, 196) ,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Roby    :    Male",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Coat    :    Short",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("age    :    7 year",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ],),
                      ),
                      
                    )
                ],
              ),
              SizedBox(height: 25,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height:192 ,width: 186,
                    child: Image.asset("asset/Rectangle 103.png",),),
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
              ),
              SizedBox(height: 25,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height:192 ,width: 186,
                    child: Image.asset("asset/Rectangle 103.png",),),
                    Container(height:192 ,width: 186,
                      color:Color.fromARGB(185, 94, 193, 196),
                      
                    )
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
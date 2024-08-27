import 'package:flutter/material.dart';
import 'package:petapp/screens/home.dart';
import 'package:petapp/screens/signinpage.dart';

class Loginpage extends StatefulWidget {
   Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final formkey=GlobalKey<FormState>();
  TextEditingController usernamecontoler =TextEditingController();
   TextEditingController emailcontoler =TextEditingController();
    TextEditingController passwordcontoler =TextEditingController();
     TextEditingController conformpasswordcontoler =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 80,top: 90),
            child: Text("Hello....",style: TextStyle(fontSize: 40,fontWeight:FontWeight.w600),),
          ),
          SizedBox(height: 40,),
          Form(
            key: formkey,
            child: Column(children: [
              SizedBox(width: 349,height: 53,
                child: TextFormField(
                  controller: usernamecontoler,
                  decoration: InputDecoration(labelText: "Username",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  validator: (value) {
                    if(value==null|| value.isEmpty){
                      return"please enter username";
                    }
                    return null;
                  },
                ),
              ),SizedBox(height: 30,),
              SizedBox(width: 349,height: 53,
                child: TextFormField(
                  controller: emailcontoler,
                  validator:(value) {
                    
                  if(value==null||value.isEmpty){
                    return"please enter email";
                  }
                 return null;
                  
                    
                  } ,
                  decoration: InputDecoration(labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(width: 349,height: 53,
                child: TextFormField(
                  controller: passwordcontoler,
                  decoration: InputDecoration(labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),validator: (value) {
                    if(value==null||value.isEmpty){
                      return "please enter password";
                    }
                    return null;
                  },
                  
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(width: 349,height: 53,
                child: TextFormField(controller: conformpasswordcontoler,
                  decoration: InputDecoration(labelText: "Conform Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "please enter password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height:30 ,),
              TextButton(onPressed: () {
                
              },
                child: InkWell(onTap: () {
                  if(formkey.currentState?.validate()??false){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                  }
                },
                  child: Container(height: 45,width: 178,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 122, 211, 125)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Login",style: TextStyle(fontSize:24,fontWeight: FontWeight.bold ,color: Colors.white),)],),),
                ),
              ),
              Text("______Or______"),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 30,width: 30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.grey),
                  child: Image.network("data:image/png;base64,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"),),
                Text("Google")],
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Alredy have an account?"),
                    TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signinpage()));
                  },
                    child: Text("Sign in"))],),
              )
            
            ],),
          ),
          
        ],),
      ),
    );
  }
}
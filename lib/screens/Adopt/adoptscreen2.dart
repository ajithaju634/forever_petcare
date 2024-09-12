import 'package:flutter/material.dart';

class Adoptscreen3 extends StatelessWidget {
  const Adoptscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(48, 177, 170, 170),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Get This Petb Your Home"),
            Card(
              child: Container(
                height: 200,
                width: 400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "enter your adress",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                maxLines: 5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 85, 176, 92)),
                child: Text(
                  "conform",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

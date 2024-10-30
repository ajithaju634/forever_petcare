// import 'package:flutter/material.dart';

// class Adoptscreen3 extends StatelessWidget {
//   const Adoptscreen3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(48, 177, 170, 170),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Text("Get This Petb Your Home"),
//             Card(
//               child: Container(
//                 height: 200,
//                 width: 400,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             SizedBox(
//               width: 400,
//               child: TextFormField(
//                 decoration: InputDecoration(
//                     labelText: "enter your adress",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 maxLines: 5,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 85, 176, 92)),
//                 child: Text(
//                   "conform",
//                   style: TextStyle(color: Colors.white),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Adoptscreen3 extends StatelessWidget {
  final Map<String, dynamic> pet;

  const Adoptscreen3({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopt ${pet['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display pet image and details
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(pet['image'] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Name: ${pet['name']}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text("Gender: ${pet['Gender']}"),
            Text("Age: ${pet['Age']} years"),
            Text("Coat: ${pet['Coat']}"),
            SizedBox(height: 20),
            
            // Adoption Form
            Text(
              "Adoption Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Additional Information',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle adoption logic here
                  // For example, saving the information to Firestore or sending an email
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Adoption Request Sent"),
                      content: Text("Thank you for your interest in adopting ${pet['name']}!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context); // Go back to the pet selection page
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Submit Adoption Request"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




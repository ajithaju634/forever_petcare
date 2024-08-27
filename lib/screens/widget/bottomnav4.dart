import 'package:flutter/material.dart';

class Profilecreen extends StatefulWidget {
  const Profilecreen({super.key});

  @override
  State<Profilecreen> createState() => _ProfilecreenState();
}

class _ProfilecreenState extends State<Profilecreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
      appBar: AppBar(backgroundColor: Color.fromARGB(48, 177, 170, 170) ,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(''),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        // Handle camera action
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // User Information
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            // Pet List
            Text(
              'My Pets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  PetCard(petName: 'Buddy', petType: 'Dog', petImage: 'asset/Rectangle 21.png'),
                  // PetCard(petName: 'Whiskers', petType: 'Cat', petImage: 'assets/cat.png'),
                  // Add more pets here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String petName;
  final String petType;
  final String petImage;

  PetCard({
    required this.petName,
    required this.petType,
    required this.petImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(petImage, width: 50, height: 50),
        title: Text(petName),
        subtitle: Text(petType),
      ),
    );
  }
}
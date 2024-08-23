import 'package:flutter/material.dart';

class Petdetails extends StatefulWidget {
  const Petdetails({super.key});

  @override
  State<Petdetails> createState() => _PetdetailsState();
}

class _PetdetailsState extends State<Petdetails> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Pet Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Pet Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s name';
                  }
                  return null;
                },
              ),SizedBox(height: 20,),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Pet Type (e.g., Dog, Cat)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s type';
                  }
                  return null;
                },
              ),SizedBox(height: 20,),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: 'Pet Breed'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s breed';
                  }
                  return null;
                },
              ),SizedBox(height: 20,),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Pet Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet\'s age';
                  }
                  return null;
                },
              ),SizedBox(height: 20,),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 30),
              ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.green) ,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process the data here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                    // You can add your data submission logic here
                  }
                },
                child: Text('Submit',style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'dart:html' as html; // Import for web
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductimagePage extends StatefulWidget {
  const ProductimagePage({super.key});

  @override
  State<ProductimagePage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductimagePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String _imageUrl = '';
  bool _isUploading = false;
  Uint8List? _imageData;

  double _rating = 1.0; // Default rating value

  Future<void> imagePicking() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        if (kIsWeb) {
          _imageData = await pickedImage.readAsBytes();
        } else {
          _imageData = null; // Handle mobile images if needed
        }
      } else {
        _imageData = null;
      }
    } catch (e) {
      log("Image picking failed: $e");
      _imageData = null;
    }
  }

  Future<void> uploadImage() async {
    if (_imageData != null) {
      setState(() {
        _isUploading = true;
      });
      try {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceFolderUpload = FirebaseStorage.instance.ref().child('product_images/');
        Reference referenceImageUpload = referenceFolderUpload.child('$uniqueFileName.jpg');

        await referenceImageUpload.putData(_imageData!);
        _imageUrl = await referenceImageUpload.getDownloadURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error in upload: $e"),
        ));
      } finally {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      final name = _nameController.text;
      final price = double.tryParse(_priceController.text) ?? 0.0; // Convert price to double

      try {
        await FirebaseFirestore.instance.collection("Products").add({
          "name": name,
          "price": price, // Store price as double
          "image": _imageUrl,
          "rating": _rating, // Store the rating
          "createdAt": FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product added successfully")),
        );
        _nameController.clear();
        _priceController.clear();
        setState(() {
          _imageUrl = '';
          _imageData = null;
          _rating = 1.0; // Reset rating
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add product: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product name";
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter price";
                  }
                  return null;
                },
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text("Rating: ${_rating.toStringAsFixed(1)}"),
              Slider(
                value: _rating,
                min: 1.0,
                max: 5.0,
                divisions: 4,
                label: _rating.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await imagePicking();
                  await uploadImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 8),
                    Text("Upload Image"),
                  ],
                ),
              ),
              if (_isUploading) CircularProgressIndicator(),
              if (_imageUrl.isNotEmpty)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.network(
                    _imageUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminimageUpload extends StatefulWidget {
  const AdminimageUpload({super.key});

  @override
  State<AdminimageUpload> createState() => _AdminimageUploadState();
}

class _AdminimageUploadState extends State<AdminimageUpload> {
  final ImagePicker _picker=ImagePicker();
  XFile? _imageFile;
  bool _siAdmin = false;
  @override
  void inistate(){
    super.initState();
    _checkIfAdmin();
  }
   Future<void> _checkIfAdmin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _siAdmin = userDoc['isAdmin'] ?? false;
        });
      }
    }
  }
   Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
        if (_siAdmin) {
          await _uploadImageToFirebase(File(pickedFile.path));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You are not authorized to upload images')));
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  Future<void> _uploadImageToFirebase(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('admin_uploads/${DateTime.now().toString()}');
      final uploadTask = storageRef.putFile(image);

      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();

      await _saveImageUrlToFirestore(downloadUrl);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully')));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
   Future<void> _saveImageUrlToFirestore(String url) async {
    try {
      await FirebaseFirestore.instance.collection('images').add({
        'imageUrl': url,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving image URL to Firestore: $e');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      body:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             if(!_siAdmin)
              _imageFile != null
                  ? Image.file(File(_imageFile!.path))
                  : Text('No image selected'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Pick Image from Gallery'),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text('Pick Image from Camera'),
              ),
            ],
          ),
      ), 
    );
  }
}
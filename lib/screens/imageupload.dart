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
// import 'dart:io';
// import 'dart:math';

// // import 'package:car_project/screens/date_time.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Adminimage extends StatefulWidget {
//   const Adminimage({super.key});

//   @override
//   State<Adminimage> createState() => _CarlistingState();
// }

// class _CarlistingState extends State<Adminimage> {
//   final formkey = GlobalKey<FormState>();
//   final TextEditingController _namecontroller = TextEditingController();
//   final TextEditingController _modelcontroller = TextEditingController();
//   final TextEditingController _perdaycontroller = TextEditingController();
//   final TextEditingController _permonthcontroller = TextEditingController();
//   String _category = '';
//   String _imageurl = '';
//   bool _isuploading = false;

//   Future<void> _submitform() async {
//     if (formkey.currentState!.validate() ?? false) {
//       final name = _namecontroller.text;
//       final model = _modelcontroller.text;
//       final perday = _perdaycontroller.text;
//       final permonth = _permonthcontroller.text;
//       final category = _category;
//       final image = _imageurl;

//       try {
//         await FirebaseFirestore.instance.collection("cardetails").add({
//           "name": name,
//           'model': model,
//           'perday': perday,
//           'permonth': permonth,
//           'category': category,
//           'image': image,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("data added succes")),
//         );
//         _namecontroller.clear();
//         _modelcontroller.clear();
//         _perdaycontroller.clear();
//         _modelcontroller.clear();
//         _permonthcontroller.clear();
//         setState(() {
//           _category = '';
//           _imageurl = '';
//         });
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("faild to add data:$e")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('details adding'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: formkey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   children: [
//                     DropdownButtonFormField(
//                         value: _category.isNotEmpty ? _category : null,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "please select category";
//                           }
//                         },
//                         decoration: InputDecoration(hintText: 'Car type'),
//                         items: ["Hatch back", "premium", "suv", "sedan"]
//                             .map((category) => DropdownMenuItem(
//                                 value: category, child: Text(category)))
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             _category = value ?? '';
//                           });
//                         }),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "please select category";
//                     }
//                   },
//                   controller: _namecontroller,
//                   decoration: InputDecoration(
//                     labelText: 'Car Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "please select category";
//                     }
//                   },
//                   controller: _modelcontroller,
//                   decoration: InputDecoration(

//                     labelText: 'Car Model',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "please select category";
//                     }
//                   },
//                   controller: _perdaycontroller,
//                   decoration: InputDecoration(
//                     labelText: 'Per Day Rent',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "please select category";
//                     }
//                   },
//                   controller: _permonthcontroller,
//                   decoration: InputDecoration(
//                     labelText: 'Per Month Rent',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     User? user = FirebaseAuth.instance.currentUser;
//                     ImagePicker _imagepicker = ImagePicker();
//                     XFile? file = await _imagepicker.pickImage(
//                         source: ImageSource.gallery);
//                     if (file == null) return;

//                     //creating image file name
//                     String _uniqueFileName =
                    
//                         DateTime.now().millisecondsSinceEpoch.toString();
//                     setState(() {
//                       _isuploading = true;
//                     });
//                     try {
//                       Reference _referenceFolderupload =
//                           FirebaseStorage.instance.ref().child('Car images/');
//                       Reference _referenceimageUpload =
//                           _referenceFolderupload.child('$_uniqueFileName.jpg');
//                       await _referenceimageUpload.putFile(File(file.path));
//                       _imageurl = await _referenceimageUpload.getDownloadURL();
//                       setState(() {
//                         _isuploading = false;
//                       });
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text("error in upload"),
//                       ));
//                       setState(() {
//                         _isuploading = false;
//                       });
//                     }
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.image),
//                       Text("upload image"),
//                     ],
//                   ),
//                 ),
//                 if (_isuploading) CircularProgressIndicator(),
//                 if (!_isuploading)
//                   _imageurl.isNotEmpty
//                       ? Container(
//                           child: Image.network(
//                             _imageurl,
//                             height: 200,
//                             width: 200,
//                             fit: BoxFit.fitHeight,
//                           ),
//                         )
//                       : Icon(
//                           Icons.broken_image,
//                           size: 150,
//                           color: Colors.grey,
//                         ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _submitform,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
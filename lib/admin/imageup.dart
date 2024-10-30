// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AdminimageUpload extends StatefulWidget {
//   const AdminimageUpload({super.key});

//   @override
//   State<AdminimageUpload> createState() => _AdminimageUploadState();
// }

// class _AdminimageUploadState extends State<AdminimageUpload> {
//   final ImagePicker _picker=ImagePicker();
//   XFile? _imageFile;
//   bool _siAdmin = false;
//   @override
//   void inistate(){
//     super.initState();
//     _checkIfAdmin();
//   }
//    Future<void> _checkIfAdmin() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//       if (userDoc.exists) {
//         setState(() {
//           _siAdmin = userDoc['isAdmin'] ?? false;
//         });
//       }
//     }
//   }
//    Future<void> _pickImage(ImageSource source) async {
//     try {
//       final pickedFile = await _picker.pickImage(source: source);
//       if (pickedFile != null) {
//         setState(() {
//           _imageFile = pickedFile;
//         });
//         if (_siAdmin) {
//           await _uploadImageToFirebase(File(pickedFile.path));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You are not authorized to upload images')));
//         }
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }
//   Future<void> _uploadImageToFirebase(File image) async {
//     try {
//       final storageRef = FirebaseStorage.instance.ref().child('admin_uploads/${DateTime.now().toString()}');
//       final uploadTask = storageRef.putFile(image);

//       final snapshot = await uploadTask.whenComplete(() => null);
//       final downloadUrl = await snapshot.ref.getDownloadURL();

//       await _saveImageUrlToFirestore(downloadUrl);

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully')));
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
//    Future<void> _saveImageUrlToFirestore(String url) async {
//     try {
//       await FirebaseFirestore.instance.collection('images').add({
//         'imageUrl': url,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error saving image URL to Firestore: $e');
//     }
//   }
  

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold( 
//       body:Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//              if(!_siAdmin)
//               _imageFile != null
//                   ? Image.file(File(_imageFile!.path))
//                   : Text('No image selected'),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _pickImage(ImageSource.gallery),
//                 child: Text('Pick Image from Gallery'),
//               ),
//               ElevatedButton(
//                 onPressed: () => _pickImage(ImageSource.camera),
//                 child: Text('Pick Image from Camera'),
//               ),
//             ],
//           ),
//       ), 
//     );
//   }
// }

// import 'dart:developer';
// import 'dart:io';

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
//   State<Adminimage> createState() => _Petadopt();
// }

// class _Petadopt extends State<Adminimage> {
//   final formkey = GlobalKey<FormState>();
//   final TextEditingController _namecontroller = TextEditingController();
//   final TextEditingController _modelcontroller = TextEditingController();
//   final TextEditingController _perdaycontroller = TextEditingController();
//   final TextEditingController _permonthcontroller = TextEditingController();
//   // String _category = '';
//   String _imageurl = '';
//   bool _isuploading = false;
//   Uint8List?_image;
//   File?selectedimage;
//   Future<void>_pickImage()async{
//     try{
//       FilePickerResult?result=await FilePicker.platform.pickFile(Filetype.image);
//     }if (result==null) {
//       return;
      
//     }
//   }

//   Future<void>imagepicking()async{
//     try{
//       final XFile? pickedimage=await ImagePicker().pickImage(source: ImageSource.gallery);
//       if(pickedimage!=null){
//         if(kIsWeb){
//           _image=await pickedimage.readAsBytes();
//         }else{
//           selectedimage=File(pickedimage.path);
//         }
//       }else{
//         _image=null;
//       }
//     }catch(e){
//       log("image picking failed :$e");
//       _image=null;
//     }
//   }

//   Future<void> _submitform() async {
//     if (formkey.currentState!.validate() ?? false) {
//       final name = _namecontroller.text;
//       final gender = _modelcontroller.text;
//       final age = _perdaycontroller.text;
//       final coat = _permonthcontroller.text;
//       // final category = _category;
//       final image = _imageurl;

//       try {
//         await FirebaseFirestore.instance.collection("cardetails").add({
//           "name": name,
//           'Gender': gender,
//           'Age': age,
//           'Coat': coat,
//           // 'category': category,
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
//           // _category = '';
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
//                 // Column(
//                 //   children: [
//                 //     DropdownButtonFormField(
//                 //         value: _category.isNotEmpty ? _category : null,
//                 //         validator: (value) {
//                 //           if (value == null || value.isEmpty) {
//                 //             return "please select category";
//                 //           }
//                 //         },
//                 //         decoration: InputDecoration(hintText: 'Car type'),
//                 //         items: ["Hatch back", "premium", "suv", "sedan"]
//                 //             .map((category) => DropdownMenuItem(
//                 //                 value: category, child: Text(category)))
//                 //             .toList(),
//                 //         onChanged: (value) {
//                 //           setState(() {
//                 //             _category = value ?? '';
//                 //           });
//                 //         }),
//                 //   ],
//                 // ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "please select category";
//                     }
//                   },
//                   controller: _namecontroller,
//                   decoration: InputDecoration(
//                     labelText: 'Pet  Name',
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

//                     labelText: 'Gender',
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
//                     labelText: 'Age',
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
//                     labelText: 'Coat',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     User? user = FirebaseAuth.instance.currentUser;
//                     ImagePicker imagepicker = ImagePicker();
//                     imagepicking();
                    
//                     // XFile? file = await imagepicker.pickImage(
//                     //     source: ImageSource.gallery);
//                     //     if (kIsWeb) {
                          
//                     //     } else {
                          
//                     //     }
//                     // if (file == null) return;

//                     // //creating image file name
//                     // String uniqueFileName =
                    
//                     //     DateTime.now().millisecondsSinceEpoch.toString();
//                     // setState(() {
//                     //   _isuploading = true;
//                     // });
//                     // try {
//                     //   Reference referenceFolderupload =
//                     //       FirebaseStorage.instance.ref().child('Car images/');
//                     //   Reference referenceimageUpload = referenceFolderupload.child('$uniqueFileName.jpg');
//                     //   await referenceimageUpload.putFile(File(file.path));
//                     //   _imageurl = await referenceimageUpload.getDownloadURL();
//                     //   setState(() {
//                     //     _isuploading = false;
//                     //   });
//                     // } catch (e) {
//                     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     //     content: Text("error in upload"),
//                     //   ));
//                     //   setState(() {
//                     //     _isuploading = false;
//                     //   });
//                     // }
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

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

class AdminImage extends StatefulWidget {
  const AdminImage({super.key});

  @override
  State<AdminImage> createState() => _AdminImageState();
}

class _AdminImageState extends State<AdminImage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _coatController = TextEditingController();
  
  String _imageUrl = '';
  bool _isUploading = false;
  Uint8List? _imageData;
  File? selectedImage;

  Future<void> imagePicking() async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        if (kIsWeb) {
          _imageData = await pickedImage.readAsBytes();
        } else {
          selectedImage = File(pickedImage.path);
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
    if (selectedImage != null) {
      setState(() {
        _isUploading = true;
      });
      try {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceFolderUpload = FirebaseStorage.instance.ref().child('Car images/');
        Reference referenceImageUpload = referenceFolderUpload.child('$uniqueFileName.jpg');

        await referenceImageUpload.putFile(selectedImage!);
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
    } else if (_imageData != null) {
      // For web
      setState(() {
        _isUploading = true;
      });
      try {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceFolderUpload = FirebaseStorage.instance.ref().child(' images/');
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
      final gender = _modelController.text;
      final age = _ageController.text;
      final coat = _coatController.text;

      try {
        await FirebaseFirestore.instance.collection("Petdetails").add({
          "name": name,
          'Gender': gender,
          'Age': age,
          'Coat': coat,
          'image': _imageUrl,
          'createdAt': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data added successfully")),
        );
        _nameController.clear();
        _modelController.clear();
        _ageController.clear();
        _coatController.clear();
        setState(() {
          _imageUrl = '';
          selectedImage = null;
          _imageData = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add data: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Adding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Pet Name";
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Pet Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Gender";
                    }
                    return null;
                  },
                  controller: _modelController,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Age";
                    }
                    return null;
                  },
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Coat";
                    }
                    return null;
                  },
                  controller: _coatController,
                  decoration: InputDecoration(
                    labelText: 'Coat',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await imagePicking();
                    await uploadImage();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      Text("Upload Image"),
                    ],
                  ),
                ),
                if (_isUploading) CircularProgressIndicator(),
                if (!_isUploading)
                  _imageUrl.isNotEmpty
                      ? Container(
                          child: Image.network(
                            _imageUrl,
                            height: 200,
                            width: 200,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Icon(
                          Icons.broken_image,
                          size: 150,
                          color: Colors.grey,
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
      ),
    );
  }
}

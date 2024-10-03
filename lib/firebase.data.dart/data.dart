import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petapp/model/appoinmntmodel.dart';

class Data {
  final userCollection = FirebaseFirestore.instance.collection("user");
  // var userCollection=FirebaseFirestore.instance.collection("user");
  Stream<List<Appointmentmodel>> getTodostream(String id) {
    return userCollection.doc(id)
    .collection("users")
    .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Appointmentmodel.fromFirestore(doc.data(),id);
      }).toList();
    });
  }
}

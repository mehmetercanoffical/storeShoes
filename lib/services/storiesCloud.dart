// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:store/models/stories.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class StoriesCloud {
  final Firestore firestore = Firestore.instance;

  Stream<QuerySnapshot> getShoes() {
    var ref = firestore.collection("product").snapshots();
    return ref;
  }


  

  Future<void> removeShoes({String docId}) async {
    var remove = await firestore.collection("product").document(docId).delete();
    return remove;
  }
}

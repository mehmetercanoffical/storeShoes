import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users {
  final String id;
  final String userName;
  final String email;
  final String profilImg;

  Users({@required this.id, this.userName, this.email, this.profilImg});

  factory Users.createFirebase(FirebaseUser firebaseUser) {
    return Users(
      id: firebaseUser.uid,
      userName: firebaseUser.displayName,
      email: firebaseUser.email,
      profilImg: firebaseUser.photoUrl,
    );
  }

  factory Users.createCloud(DocumentSnapshot doc) {
    var docData = doc.data;
    return Users(
      id: doc.documentID,
      userName: docData["userName"],
      email: docData["email"],
      profilImg: docData["profilImg"],
    );
  }
}

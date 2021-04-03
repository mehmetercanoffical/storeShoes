import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/models/user/addrress.dart';

class Users {
  final String id;
  final String userName;
  final String email;
  final String profilImg;
  final String phoneNumber;
  Address address;

  Users({
    @required this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.profilImg,
    this.address,
  });

  factory Users.createFirebase(FirebaseUser firebaseUser) {
    return Users(
      phoneNumber: firebaseUser.phoneNumber,
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
      phoneNumber: docData["phoneNumber"],
      userName: docData["userName"],
      email: docData["email"],
      profilImg: docData["profilImg"],
      address: docData["address"],
    );
  }
}

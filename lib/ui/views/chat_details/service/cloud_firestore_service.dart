import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CloudFirestoreService {
  final db = FirebaseFirestore.instance;
  void addData(String username, String email, String password) {
    final users = <String, dynamic>{
      "name": username,
      "uid": FirebaseAuth.instance.currentUser?.uid,
      "email": email,
      "password": password,
    };
    db
        .collection("users")
        .doc("${FirebaseAuth.instance.currentUser?.uid}")
        .set(users)
        .onError((e, _) => debugPrint("Error writing document: $e"));
  }
}

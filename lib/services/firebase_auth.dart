import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthUser {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFirebase(
      String username, String email, String password, String phone) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "address": "null",
        "status": true,
      });
    } catch (e) {
      // ignore: avoid_print
      print("Failed to add user: $e");
    }
  }

  Future<String> getDataAsJson(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(documentId)
          .get();
      Object data = documentSnapshot.data()!;
      return jsonEncode(data);
    } catch (e) {
      // ignore: avoid_print
      print("Failed to get data: $e");
      return "";
    }
  }

  Future<void> updateUserData(
      String documentId, Map<String, dynamic> userData) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(documentId)
          .update(userData);
    } catch (e) {
      print("Failed to update user data: $e");
    }
  }
}

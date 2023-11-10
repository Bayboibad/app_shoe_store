import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthUser {
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
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      return jsonEncode(data);
    } catch (e) {
      // ignore: avoid_print
      print("Failed to get data: $e");
      return "";
    }
  }

  Future<void> updateUserData(String documentId, Map<String, dynamic> userData,
      String email, String password) async {
    try {
      final custUser = FirebaseAuth.instance.currentUser;

      if (custUser != null) {
        await custUser.updateEmail(email);
        await custUser.updatePassword(password);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(documentId)
            .update(userData);

        print("User data updated successfully");
      } else {
        print('User not logged in');
      }
    } catch (e) {
      print("Failed to update user data: $e");
    }
  }
}

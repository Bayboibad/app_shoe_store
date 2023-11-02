import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreUser{
  final CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future<void> addUserFisebase(
    String username, String email, String password, String phone
  ){
    return users.add(
      {
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "address":"null",
        "status": true,
      }
    // ignore: invalid_return_type_for_catch_error, avoid_print
    ).catchError((error) => print("Failed to add user: $error"));
  }

  Future<DocumentSnapshot?> getUserFirebase(String email, String password) async {
  QuerySnapshot userSnapshot =
      await users.where('email', isEqualTo: email).get();

  if (userSnapshot.docs.isNotEmpty) {
    DocumentSnapshot userDoc = userSnapshot.docs.first;
    String storedPassword = userDoc.get('password') as String;
    if (storedPassword == password) { // Kiểm tra password
      return userDoc;
    } else {
      // ignore: avoid_print
      print('Mật khẩu không chính xác.');
      return null;
    }
  } else {
    // ignore: avoid_print
    print('Không tìm thấy người dùng với username này.');
    return null;
  }
}
}
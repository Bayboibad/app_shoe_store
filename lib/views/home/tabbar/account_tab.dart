// ignore_for_file: non_constant_identifier_names


import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/configs/string.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/account_shoe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  void _signOut() {
    FirebaseAuth.instance.signOut();
  }

  String username = "";
  String email = "";
  String phone = "";
  String password = "";
  String address = "";

  // Create a reference to the user document
  final userDocumentRef =
      FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    super.initState();

    // Listen to changes in the user document and update the state
    userDocumentRef.snapshots().listen((documentSnapshot) {
      if (documentSnapshot.exists) {
        final userData = documentSnapshot.data() as Map<String, dynamic>;

        setState(() {
          username = userData['username'];
          email = userData['email'];
          password = userData['password'];
          phone = userData['phone'];
          address = userData['address'];
        });
      } else {
        print("User data not found or an error occurred.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Tiltes.Acount),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.currentTheme == lightMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.account_circle,
                        size: 90,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Text(
                        username,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  ProfileShoe(
                                    username: username,
                                    email: email,
                                    phone: phone,
                                    password: password,
                                    address: address)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: themeProvider.currentTheme == lightMode
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: _ItemLayout(() {}, "Thông tin"),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: themeProvider.currentTheme == lightMode
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: _ItemLayout(() {}, "Cài đặt"),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: themeProvider.currentTheme == lightMode
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: _ItemLayout(() {}, "Giới Thiệu"),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 40,
                  child: MyButton(
                      onTap: () {
                        _signOut();
                      },
                      title: "Đăng Xuất"),
                ))
          ],
        ),
      ),
    );
  }
}

Widget _ItemLayout(Function() onTap, String title) {
  return Container(
    height: 50,
    child: Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            size: 25,
          ),
        )
      ],
    ),
  );
}

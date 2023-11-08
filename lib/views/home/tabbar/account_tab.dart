// ignore_for_file: non_constant_identifier_names

import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/configs/string.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/account_shoe.dart';
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

  final user = FirebaseAuth.instance.currentUser;

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
            const Expanded(flex: 3, child: Text("")),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileShoe()));
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
                        child: _ItemLayout(() {
                        
                        }, "Thông tin"),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: (){},
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
                      onTap: (){},
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
  return Container (
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

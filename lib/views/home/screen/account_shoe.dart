import 'package:flutter/material.dart';

class ProfileShoe extends StatefulWidget {
  const ProfileShoe({super.key});

  @override
  State<ProfileShoe> createState() => _ProfileShoeState();
}

class _ProfileShoeState extends State<ProfileShoe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin"),
      ),
      body: const SingleChildScrollView(
        child: Text("data"),
      ),
    );
  }
}


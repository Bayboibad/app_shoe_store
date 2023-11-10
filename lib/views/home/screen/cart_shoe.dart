// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartShoe extends StatefulWidget {
  const CartShoe({super.key});

  @override
  State<CartShoe> createState() => _CartShoeState();
}

class _CartShoeState extends State<CartShoe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giỏ hàng")),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Text("Giỏ hàng"),
        ),
      ),
    );
  }
}
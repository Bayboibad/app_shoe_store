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
      appBar: AppBar(title: Text("Giỏ hàng")),
      body: SingleChildScrollView(
        child: Container(
          child: Text("Giỏ hàng"),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PayShoe extends StatefulWidget {
  const PayShoe({super.key});

  @override
  State<PayShoe> createState() => _PayShoeState();
}

class _PayShoeState extends State<PayShoe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng"),

      ),
      body: const Text("data"),
    );
  }
}
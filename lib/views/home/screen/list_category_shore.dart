// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ListCategoryShoe extends StatefulWidget {
  String name;
   ListCategoryShoe({super.key, required this.name});

  @override
  State<ListCategoryShoe> createState() => _ListCategoryShoeState();
}

class _ListCategoryShoeState extends State<ListCategoryShoe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),)
    );
  }
}

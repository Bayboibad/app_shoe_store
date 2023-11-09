// ignore_for_file: must_be_immutable


import 'package:app_shoe_store/model/category_model.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/list_category_shore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartAll extends StatefulWidget {
  List<Category> cart = [];
  CartAll({super.key, required this.cart});

  @override
  State<CartAll> createState() => _CartAllState();
}

class _CartAllState extends State<CartAll> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Thể Loại"),
      ),
      body: ListView.builder(
      itemCount: widget.cart.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 8, right: 8),
                margin: const EdgeInsets.only(top: 8,left: 8,right: 8),
                decoration: BoxDecoration(
                  color: themeProvider.currentTheme == lightMode
                      ? Colors.orangeAccent.shade200
                      : Colors.orangeAccent.shade700,
                      boxShadow: kElevationToShadow[2],
                  borderRadius: BorderRadius.circular(8),
                ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> 
              ListCategoryShoe(name: widget.cart[index].name.toString())
              
              ));
            },
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      widget.cart[index].name.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
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
          ),
        );
      },
    ),
    );
  }
}

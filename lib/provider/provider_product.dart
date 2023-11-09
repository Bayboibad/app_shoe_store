import 'package:app_shoe_store/model/product_shoe.dart';
import 'package:app_shoe_store/services/product_services.dart';
import 'package:flutter/material.dart';

class ProviderProductShoe extends ChangeNotifier{
   final sevice = ApiProduct();
   List<Product> _shoes=[];
   List<Product> get shoes => _shoes;
   getAllShoes() async {
    final res = await sevice.fetchData();
    _shoes = res;
    notifyListeners();
   }
}
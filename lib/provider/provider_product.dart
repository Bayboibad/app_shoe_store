import 'package:app_shoe_store/model/product_shoe.dart';
import 'package:app_shoe_store/services/api_product.dart';
import 'package:flutter/material.dart';

class ProviderProductShoe extends ChangeNotifier{
   final sevice = ApiProduct();
   List<Datum> _shoes=[];
   List<Datum> get shoes => _shoes;
   getAllShoes() async {
    final res = await sevice.fetchData();
    _shoes = res;
    notifyListeners();
   }
}
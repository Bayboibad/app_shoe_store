import 'package:app_shoe_store/model/category_model.dart';
import 'package:app_shoe_store/services/category_services.dart';
import 'package:flutter/material.dart';


class CategoryProvider extends ChangeNotifier {
  final sevice = ApiCategory();
  List<Category> _cat = [];
  List<Category> get cat => _cat;
  getAllCategoryShoes() async {
    try{
      final res = await sevice.fetchDataCarygo();
    _cat = res;
    notifyListeners();
    }catch(e){
      // ignore: unnecessary_brace_in_string_interps, avoid_print
      print("looiex ${e}");
    }
  }
}

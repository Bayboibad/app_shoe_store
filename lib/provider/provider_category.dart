import 'package:app_shoe_store/model/category_model.dart';
import 'package:app_shoe_store/services/category_services.dart';
import 'package:flutter/material.dart';


class CategoryProvider extends ChangeNotifier {
  final sevice = ApiCategory();
  List<Category> _cat = [];
  List<Category> get cat => _cat;
  getAllCategoryShoes() async {
    final res = await sevice.fetchDataCarygo();
    _cat = res;
    notifyListeners();
  }
}

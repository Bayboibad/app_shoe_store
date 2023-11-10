import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_shoe_store/model/category_model.dart';

class ApiCategory {
  fetchDataCarygo() async {
    String url = 'https://wczjr6-3001.csb.app/list-cat';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonCat = jsonDecode(response.body)["data"];


  // ignore: unnecessary_type_check
  if (jsonCat is List) {
        final List<Category> cat = jsonCat
            .map((e) => Category(
                   id: e["_id"],
                   name: e["name"],
                ))
            .toList();
        return cat;
      }
      }
      return [];
    } catch (e) {
      // ignore: avoid_print
      print("Network error");
    }
  }
}



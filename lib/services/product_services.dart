import 'dart:convert';
import 'package:app_shoe_store/model/product_shoe.dart';
import 'package:http/http.dart' as http;

class ApiProduct {
  fetchData() async {
    String url = 'https://7792rl-3000.csb.app/dataShoesl';
   try{
       final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data'];

      // ignore: unnecessary_type_check
      if (jsonData is List) {
        final List<Product> shoes = jsonData
            .map((e) => Product(
                  id: e["_id"],
                  name: e["name"],
                  cart: e["cart"],
                  brand: e["brand"],
                  priceNew: e["priceNew"],
                  priceOld: e["priceOld"],
                  number: e["number"],
                  description: e["description"],
                  avatarFile: e["avartarFile"],
                  productSizes: e["productSizes"] == null
                      ? []
                      : List<String>.from(e["productSizes"].map((x) => x)),
                ))
            .toList();
        return shoes;
      }
    }
    return [];
   }catch(e){
    // ignore: avoid_print
    print("Lỗi mạng");
   }
  }
}

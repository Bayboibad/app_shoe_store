import 'package:app_shoe_store/model/product_shoe.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/item_shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchShoe extends StatefulWidget {
  List<Product> searchData = [];
  String url;
  SearchShoe({super.key, required this.searchData, required this.url});

  @override
  State<SearchShoe> createState() => _SearchShoeState();
}

class _SearchShoeState extends State<SearchShoe> {
  final searhController = TextEditingController();
  // ignore: prefer_final_fields

  @override
  void initState() {
    super.initState();
    searhController.addListener(() {
      // ignore: unused_local_variable
      var query = searhController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            flex: 9,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              margin: const EdgeInsets.only(left: 64),
              child: TextFormField(
                controller: searhController,
                cursorColor: themeProvider.currentTheme == lightMode
                    ? Colors.black
                    : Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    searhController.clear();
                  });
                },
                child: const Icon(Icons.close),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Result(data: widget.searchData, url: widget.url),
        ),
      ),
    );
  }
}

class Result extends StatefulWidget {
  final List<Product> data;
  final String url;
  const Result({super.key, required this.data, required this.url});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.all(0),
          height: 55,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemShoe(
                          name: widget.data[index].name.toString(),
                          url: widget.url,
                          cart: widget.data[index].cart.toString(),
                          brand: widget.data[index].brand.toString(),
                          priceNew: widget.data[index].priceNew.toString(),
                          priceOld: widget.data[index].priceOld.toString(),
                          number: widget.data[index].number.toString(),
                          description: widget.data[index].description.toString(),
                          avatarFile: widget.data[index].avatarFile.toString(),
                          productSizes: widget.data[index].productSizes!.toList())));
            },
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${widget.url}${widget.data[index].avatarFile}"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    widget.data[index].name.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

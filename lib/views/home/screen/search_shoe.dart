import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchShoe extends StatefulWidget {
  SearchShoe({super.key});

  @override
  State<SearchShoe> createState() => _SearchShoeState();
}

class _SearchShoeState extends State<SearchShoe> {
  final controller = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

void didChangeDependencies() {
  super.didChangeDependencies();
  FocusScope.of(context).requestFocus(_searchFocusNode);
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
                controller: controller,
                focusNode: _searchFocusNode,
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
                    controller.clear();
                  });
                },
                child: Icon(Icons.close),
              ))
        ],
      ),
    );
  }
}

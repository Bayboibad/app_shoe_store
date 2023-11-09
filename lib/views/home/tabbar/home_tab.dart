import 'package:app_shoe_store/composents/my_text_button.dart';
import 'package:app_shoe_store/model/category_model.dart';
import 'package:app_shoe_store/provider/provider_category.dart';
import 'package:app_shoe_store/provider/provider_product.dart';
import 'package:app_shoe_store/views/home/intro_slider/intro_product.dart';
import 'package:app_shoe_store/views/home/layout/all_cart.dart';
import 'package:app_shoe_store/views/home/screen/cart_item.dart';
import 'package:app_shoe_store/views/home/screen/cart_shoe.dart';
import 'package:app_shoe_store/views/home/screen/product_item_shoe.dart';
import 'package:app_shoe_store/views/home/screen/search_shoe.dart';
import 'package:app_shoe_store/views/loading/screem_load.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // ignore: unused_field
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderProductShoe>().getAllShoes();
      context.read<CategoryProvider>().getAllCategoryShoes();
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }
  

  String url = "https://7792rl-3000.csb.app/";
  // ignore: prefer_final_fields, unused_field
  FocusNode _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logdug Store'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchShoe()));
              },
              icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartShoe()));
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: LiquidPullToRefresh(
        onRefresh: () async{  },
        child: Consumer2<ProviderProductShoe,CategoryProvider>(
          builder:
              (BuildContext context, ProviderProductShoe value,CategoryProvider cate, Widget? child) {
            if (_isLoading) {
              return const Center(
                child: SceenHomeLoad(),
              );
            }
             
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      width: screenWidth,
                      child: const IntroProduct(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _textButton("Loại Giày", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CartAll(cart: cate.cat)));
                    }, "Tất cả"),
                    const SizedBox(height: 8),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: SizedBox(
                        height: 40,
                        width: screenWidth,
                        child: CartItem(cartItems: cate.cat),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _textButton("Tất cả loại giày", () {}, ""),
                    const SizedBox(height: 8),
                    // ignore: avoid_unnecessary_containers
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ProductItemShoe(
                          products: value.shoes,
                          url: url,
                          width: screenWidth,
                          height: screenHeight),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _textButton(String text, Function() onTap, String title) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.topRight,
            child: MyTextButton(onTap: onTap, title: title),
          ),
        )
      ],
    );
  }
}

import 'package:app_shoe_store/model/product_shoe.dart';
import 'package:app_shoe_store/provider/provider_product.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/list_category_shore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final List<Datum>
      cartItems; // Thêm thuộc tính để truyền danh sách sản phẩm trong giỏ hàng
  const CartItem({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProductShoe>(context, listen: false).getAllShoes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<ProviderProductShoe>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: widget.cartItems
              .length, // Sử dụng danh sách sản phẩm trong giỏ hàng từ tham số
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ListCategoryShoe(
                          name: widget.cartItems[index].cart.toString(),
                        )));
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 8, right: 8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[2],
                  color: themeProvider.currentTheme == lightMode
                      ? Colors.orangeAccent.shade200
                      : Colors.orangeAccent.shade700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.cartItems[index].cart.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: themeProvider.currentTheme == lightMode
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

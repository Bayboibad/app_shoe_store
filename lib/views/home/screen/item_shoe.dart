import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/configs/colors.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/pay_shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemShoe extends StatefulWidget {
  String name;
  String cart;
  String brand;
  String priceNew;
  String priceOld;
  String number;
  String description;
  String avatarFile;
  List<String> productSizes = [];

  String url;
  ItemShoe(
      {super.key,
      required this.name,
      required this.url,
      required this.cart,
      required this.brand,
      required this.priceNew,
      required this.priceOld,
      required this.number,
      required this.description,
      required this.avatarFile,
      required this.productSizes});

  @override
  State<ItemShoe> createState() => _ItemShoeState();
}

class _ItemShoeState extends State<ItemShoe> {
  bool isButtonPay = false;
  bool isButtonAdd = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _silerShow(),
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: themeProvider.currentTheme == lightMode
                              ? Colors.white
                              : Colors.black,
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Text(widget.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: themeProvider.currentTheme ==
                                              lightMode
                                          ? Colors.black
                                          : Colors.white)),
                            ],
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          color: themeProvider.currentTheme == lightMode
                              ? Colors.white
                              : Colors.black,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Row(children: [
                                  Text('${widget.priceNew} đ ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: themeProvider.currentTheme ==
                                                  lightMode
                                              ? AppColors.BackgroudApp
                                              : Colors.red)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('${widget.priceOld} đ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: themeProvider.currentTheme ==
                                                  lightMode
                                              ? Colors.grey
                                              : Colors.grey.shade200)),
                                ]),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      //Bottom layout
                      Container(
                          height: 70,
                          color: themeProvider.currentTheme == lightMode
                              ? Colors.white
                              : Colors.black,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.account_circle,
                                        size: 50,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      // ignore: unnecessary_string_interpolations
                                      Text('${widget.brand}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  themeProvider.currentTheme ==
                                                          lightMode
                                                      ? Colors.black
                                                      : Colors.grey.shade200)),
                                    ],
                                  )),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: themeProvider.currentTheme == lightMode
                            ? Colors.white
                            : Colors.black,
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Mô tả sản phẩm",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            // ignore: unnecessary_string_interpolations
                            Text(
                              "${widget.description}",
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[2],
                      color: themeProvider.currentTheme == lightMode
                          ? Colors.white
                          : Colors.grey),
                  child: Row(children: [
                    Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isButtonAdd = !isButtonAdd;
                            });
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.BackgroudApp,
                              boxShadow: kElevationToShadow[2],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  isButtonAdd ? "Đã thêm" : "Thêm giỏ hàng",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: themeProvider.currentTheme ==
                                              lightMode
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: MyButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PayShoe()));
                            },
                            title: "Mua")),
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}

Widget _silerShow() {
  return ImageSlideshow(
    indicatorColor: Colors.blue,
    onPageChanged: (value) {
      debugPrint('Page changed: $value');
    },
    autoPlayInterval: 3000,
    isLoop: true,
    children: [
      Image.network(
        'https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg',
        fit: BoxFit.cover,
      ),
    ],
  );
}

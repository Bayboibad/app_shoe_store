import 'package:app_shoe_store/model/product_shoe.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:app_shoe_store/views/home/screen/item_shoe.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductItemShoe extends StatefulWidget {
  List<Datum> products;
  String url;
  double width;
  double height;
  ProductItemShoe(
      {super.key,
      required this.products,
      required this.url,
      required this.width,
      required this.height});

  @override
  State<ProductItemShoe> createState() => _ProductItemShoeState();
}

class _ProductItemShoeState extends State<ProductItemShoe> {
  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.decimalPattern();
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisExtent: 270,
      ),
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        List<String> productSizes =
            List<String>.from(widget.products[index].productSizes as Iterable);

        double priceNewSale = widget.products[index].priceNew!.toDouble();
        double priceOldSale = widget.products[index].priceOld!.toDouble();
        double salePrice = ((priceOldSale - priceNewSale) / priceOldSale) * 100;
        String result = salePrice.toStringAsFixed(2);
        double parsedResult = double.parse(result);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemShoe(
                  name: widget.products[index].name.toString(),
                  url: widget.url,
                  cart: widget.products[index].cart.toString(),
                  brand: widget.products[index].brand.toString(),
                  priceNew: numberFormat.format(
                      double.parse(widget.products[index].priceNew.toString())),
                  priceOld: numberFormat.format(
                      double.parse(widget.products[index].priceOld.toString())),
                  number: widget.products[index].number.toString(),
                  description: widget.products[index].description.toString(),
                  avatarFile: widget.products[index].avatarFile.toString(),
                  productSizes: productSizes,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
            decoration: BoxDecoration(
              color: themeProvider.currentTheme == lightMode
                  ? Colors.white
                  : Colors.black,
              boxShadow: kElevationToShadow[2],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: widget.width,
                  height: 140,
                  child: ImagesImage(
                      imagesUrl:
                          "${widget.url}${widget.products[index].avatarFile}"),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.products[index].name.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _sale(parsedResult),
                      const SizedBox(height: 4),
                      _price(
                        numberFormat.format(double.parse(
                            widget.products[index].priceNew.toString())),
                        numberFormat.format(double.parse(
                            widget.products[index].priceOld.toString())),
                      ),
                    ],
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

class ImagesImage extends StatefulWidget {
  final String imagesUrl;
  const ImagesImage({super.key, required this.imagesUrl});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImagesImage> {
  bool isFavorite = false; // Trạng thái yêu thích
  void tym() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            image: DecorationImage(
              image: NetworkImage(widget.imagesUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              tym();
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _sale(double sale) {
  return Stack(
    alignment: Alignment.topLeft,
    children: [
      Container(
        margin: const EdgeInsets.all(4),
        alignment: Alignment.topLeft,
        child: Image.asset(
          "./assets/images/nensale.png",
          width: 100,
          height: 20,
          fit: BoxFit.fill,
        ),
      ),
      // ignore: sized_box_for_whitespace
      Container(
        width: 100,
        height: 20,
        alignment: Alignment.bottomCenter,
        child: Text(
          "Giảm ${sale}%",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    ],
  );
}

Widget _price(String priceNew, String priceOld) {
  // Định dạng số với dấu phẩy sau hàng nghìn

  return Row(
    children: [
      Expanded(
        flex: 6,
        child: Text(
          '${priceNew} đ', // Hiển thị giá mới với dấu phẩy
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        flex: 4,
        child: Text(
          '${priceOld}', // Hiển thị giá cũ với dấu phẩy
          style: const TextStyle(
              decoration: TextDecoration.lineThrough, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}

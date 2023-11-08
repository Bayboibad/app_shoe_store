class Datum {
  String? id;
  String? name;
  String? cart;
  String? brand;
  int? priceNew;
  int? priceOld;
  int? number;
  String? description;
  String? avatarFile;
  List<String>? productSizes;
  int? v;

  Datum({
    this.id,
    this.name,
    this.cart,
    this.brand,
    this.priceNew,
    this.priceOld,
    this.number,
    this.description,
    this.avatarFile,
    this.productSizes,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['_id'],
      name: json['name'],
      cart: json['cart'],
      brand: json['brand'],
      priceNew: json['priceNew'],
      priceOld: json['priceOld'],
      number: json['number'],
      description: json['description'],
      avatarFile: json['avartarFile'], // Cập nhật tên trường dữ liệu
      productSizes: (json['productSizes'] as List?)?.cast<String>(),
      v: json['__v'],
    );
  }
}

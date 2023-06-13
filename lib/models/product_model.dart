import 'dart:convert';

List<ShowProduct> showProductFromJson(String str) => List<ShowProduct>.from(
    json.decode(str).map((x) => ShowProduct.fromJson(x)));

String showProductToJson(List<ShowProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowProduct {
  ShowProduct({
    required this.sId,
    required this.name,
    required this.description,
    required this.price,
  });

  String sId;

  String name;

  String description;

  int price;

  factory ShowProduct.fromJson(Map<String, dynamic> json) => ShowProduct(
        sId: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": sId,
        "name": name,
        "description": description,
        "price": price,
      };
}

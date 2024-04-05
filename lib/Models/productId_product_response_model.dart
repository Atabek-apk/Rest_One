// To parse this JSON data, do
//
//     final getproductbyproducId = getproductbyproducIdFromJson(jsonString);

import 'dart:convert';

List<GetproductbyproducId> getproductbyproducIdFromJson(String str) => List<GetproductbyproducId>.from(json.decode(str).map((x) => GetproductbyproducId.fromJson(x)));

String getproductbyproducIdToJson(List<GetproductbyproducId> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetproductbyproducId {
  int productId;
  String name;
  String imagePath;
  int reqularPrice;
  int discountPrice;
  int quantity;

  GetproductbyproducId({
    required this.productId,
    required this.name,
    required this.imagePath,
    required this.reqularPrice,
    required this.discountPrice,
    required this.quantity,
  });

  factory GetproductbyproducId.fromJson(Map<String, dynamic> json) => GetproductbyproducId(
    productId: json["productId"],
    name: json["name"],
    imagePath: json["imagePath"],
    reqularPrice: json["reqularPrice"],
    discountPrice: json["discountPrice"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "imagePath": imagePath,
    "reqularPrice": reqularPrice,
    "discountPrice": discountPrice,
    "quantity": quantity,
  };
}

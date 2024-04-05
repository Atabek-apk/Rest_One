import 'package:rest_one/constants/file_assistans.dart';



List<TachProduct> tachProductListFromJson(String str) => List<TachProduct>.from(json.decode(str).map((x) => TachProduct.fromJson(x)));

String tachProductToJson(List<TachProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

var uuid = const Uuid();

class TachProduct {
  int id;
  String imagePath;
  String name;
  String description;
  String category;
  int order;
  int regularPrice;
  int discountPrice;
  int quantity;
  int sku;
  int categoryId;

  TachProduct({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.category,
    required this.order,
    required this.regularPrice,
    required this.discountPrice,
    required this.quantity,
    required this.sku,
    required this.categoryId,
  });

  factory TachProduct.fromJson(Map<String, dynamic> json) => TachProduct(
    id: json["id"],
    imagePath: json["imagePath"],
    name: json["name"],
    description: json["description"],
    category: json["category"],
    order: json["order"],
    regularPrice: json["regularPrice"],
    discountPrice: json["discountPrice"],
    quantity: json["quantity"],
    sku: json["sku"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imagePath": imagePath,
    "name": name,
    "description": description,
    "category": category,
    "order": order,
    "regularPrice": regularPrice,
    "discountPrice": discountPrice,
    "quantity": quantity,
    "sku": sku,
    "categoryId": categoryId,
  };
}



import 'package:rest_one/constants/file_assistans.dart';

List<TachCategory> tachCategoryListFromJson(String str) =>
    List<TachCategory>.from(json.decode(str).map((x) => TachCategory.fromJson(x)));

// String tachCategoryToJson(List<TachCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TachCategory {
  int id;
  String name;
  int order;
  String icon;

  TachCategory({
    required this.id,
    required this.name,
    required this.order,
    required this.icon,
  });

  factory TachCategory.fromJson(Map<String, dynamic> json) => TachCategory(
    id: json["id"],
    name: json["name"],
    order: json["order"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "order": order,
    "icon": icon,
  };
}

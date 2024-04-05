import 'package:rest_one/constants/file_assistans.dart';

List<TachBanner> tachBannerListFromJson(String str) => List<TachBanner>.from(json.decode(str).map((x) => TachBanner.fromJson(x)));

String tachBannerToJson(List<TachBanner> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TachBanner {
  int id;
  String title;
  int order;
  String imagePath;
  bool isPublish;

  TachBanner({
    required this.id,
    required this.title,
    required this.order,
    required this.imagePath,
    required this.isPublish,
  });

  factory TachBanner.fromJson(Map<String, dynamic> json) => TachBanner(
    id: json["id"],
    title: json["title"],
    order: json["order"],
    imagePath: json["imagePath"],
    isPublish: json["isPublish"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "order": order,
    "imagePath": imagePath,
    "isPublish": isPublish,
  };
}

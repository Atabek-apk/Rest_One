import 'package:http/http.dart' as http;
import 'package:rest_one/service/base_url.dart';

class TachServiceBanner {
  var client = http.Client();
  Future<dynamic> getBanner() async {
    var response = await client.get(Uri.parse("${baseurl}api/bannerapi"));
    print("getBanner => ${response.body}");
    return response;
  }
}

//
//
// import 'dart:convert';
// import 'package:http/http.dart'as http;
//
// String baseurl = "https://192.168.172.1:5001/";
//
// class TachServiceCategorys{
//   var client = http.Client();
//   Future<List<TachCategory>> getCategorys() async {
//     var response = await client
//         .get(Uri.parse("${baseurl}api/productapi/getallcategory"));
//     print("getCategorys => ${response.body}");
//     List result = jsonDecode(response.body);
//     return result.map((e) => TachCategory.fromJson(e)).toList();
//   }
// }
//
// class TachServiceProducts{
//   var client = http.Client();
//   Future<List<TachProduct>> getProduct() async {
//     var response = await client
//         .get(Uri.parse("${baseurl}api/productapi/getallproduct"));
//     print("getProduct => ${response.body}");
//     List result = jsonDecode(response.body);
//     return result.map((e) => TachProduct.fromJson(e)).toList();
//   }
// }
//
// class TachServiceBanner{
//   var client = http.Client();
//   Future<List<TachBanner>> getBanner() async {
//     var response = await client
//         .get(Uri.parse("${baseurl}api/bannerapi"));
//     print("getBanner => ${response.body}");
//     List result = jsonDecode(response.body);
//     return result.map((e) => TachBanner.fromJson(e)).toList();
//   }
// }

import 'package:http/http.dart' as http;
import 'base_url.dart';

class TachServiceCategorys {
  var client = http.Client();
  Future<dynamic> getCategorys() async {
    var response =
    await client.get(Uri.parse("${baseurl}api/productapi/getallcategoryy"));
    print("getCategorys => ${response.body}");
    return response;
  }
}
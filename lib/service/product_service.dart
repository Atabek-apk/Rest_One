import 'package:http/http.dart' as http;
import 'base_url.dart';

class TachServiceProducts {
  var client = http.Client();
  Future<dynamic> getProduct() async {
    var response =
    await client.get(Uri.parse("${baseurl}api/productapi/getallproduct"));
    print("getProduct => ${response.body}");
    return response;
  }
}
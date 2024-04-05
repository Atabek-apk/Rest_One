import 'package:http/http.dart' as http;
import 'package:rest_one/Models/order_post_model.dart';
import 'package:rest_one/constants/file_assistans.dart';


class TachServiceOrder {
  static var client = http.Client();

  Future<bool> orderPost(OrderModel model) async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse("${baseurl}api/orderapi");
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      print('Post gitdi 1 : ${response.statusCode}');
      // return "Posted Order";
      return true;
    } else {
      print('Post gitdi 2 : ${response.statusCode}');
      // return "Fail";
      return false;
    }
  }
}

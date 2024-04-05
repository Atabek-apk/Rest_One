import 'package:http/http.dart' as http;
import 'package:rest_one/constants/file_assistans.dart';
import '../Models/userId_orders_response_model.dart';
import 'base_url.dart';

class  TachServiceGetOrdersById{
  Future<List<UserIdResponseOrders>> getUserIDOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('userID');
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
        Uri.parse("${baseurl}api/orderapi/getOrdersbyUserID/${id}"),
        headers: requestHeaders);
    if(response.statusCode==200){

      var product = userIdOrdersResponseFromJson(response.body);

      return product;
    }else{
     throw Exception("Failed to get Orders");
    }
  }
}

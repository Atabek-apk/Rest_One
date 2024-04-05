import 'package:http/http.dart' as http;
import 'package:rest_one/constants/file_assistans.dart';
import '../Models/productId_product_response_model.dart';
import '../Models/userId_orders_response_model.dart';
import 'base_url.dart';

class  TachServiceGetProductsByProductId{
  Future<List<GetproductbyproducId>> getOrdersProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? prodId = prefs.getInt('prodId');
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
        Uri.parse("${baseurl}api/orderapi/getOrderProductsbyOrderId/${prodId}"),
        headers: requestHeaders);
    print("Status code : ${response.statusCode}");
    if(response.statusCode==200){

      var product = getproductbyproducIdFromJson(response.body);

      return product;
    }else{
      throw Exception("Failed to get Orders");
    }
  }
}

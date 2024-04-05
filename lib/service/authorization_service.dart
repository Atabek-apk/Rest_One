import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;
import 'package:rest_one/Models/login_response_model.dart';
import 'package:rest_one/Models/register_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'base_url.dart';

class TachServiseAuth {
  static var client = http.Client();
  Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse("${baseurl}api/userapi/login");
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userToken = loginResponseModelFromJson(response.body).token;
      String userPhNum = loginResponseModelFromJson(response.body).phoneNumber;
      String userFirstNm = loginResponseModelFromJson(response.body).firstName;
      String userLastNm = loginResponseModelFromJson(response.body).lastName;
      String userAddress = loginResponseModelFromJson(response.body).address;
      String userID = loginResponseModelFromJson(response.body).userId;

      await prefs.setString('token', userToken);
      await prefs.setString('userPhNumber', userPhNum);
      await prefs.setString('userFirstName', userFirstNm);
      await prefs.setString('userLastName', userLastNm);
      await prefs.setString('userAddress', userAddress);
      await prefs.setString('userID', userID);
      await prefs.setBool('isLogged', true);
      print("eeeeeeeeeh1  ${prefs.getString('token').toString()}");
      print("eeeeeeeeeh2  ${prefs.getString('userPhNumber').toString()}");
      print("eeeeeeeeeh3  ${prefs.getString('userFirstName').toString()}");
      print("eeeeeeeeeh4  ${prefs.getString('userLastName').toString()}");
      print("eeeeeeeeeh5  ${prefs.getString('userAddress').toString()}");
      print("eeeeeeeeeh6  ${prefs.getString('userID').toString()}");
      print("eeeeeeeeeh7  ${prefs.getBool('isLogged').toString()}");
      return true;
    } else {
      Grock.snackBar(
          title: "Bildiriş",
          description: "Ulanyjy adyňyzy we Parolyňyzy dogry giriziň !",
          position: SnackbarPosition.bottom);
      return false;
    }
  }

  Future<bool> signup(RegisterModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse("${baseurl}api/userapi/register");
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      Grock.snackBar(
          title: "Bildiriş",
          description: "Ulanyjy ady öň ulanylan !",
          position: SnackbarPosition.bottom);
      return false;
    }
  }
}
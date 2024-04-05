import 'package:flutter/material.dart';
import 'package:rest_one/Models/login_response_model.dart';
import 'package:rest_one/Models/order_post_model.dart';
import 'package:rest_one/Models/register_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/service/authorization_service.dart';
import 'package:rest_one/service/order_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;
  set isObsecure(bool newState) {
    _isObsecure = newState;
    notifyListeners();
  }

  bool _processing = false;
  bool get processing => _processing;
  set processing(bool newState) {
    _processing = newState;
    notifyListeners();
  }

  bool _loginResponseBool = false;
  bool get loginResponseBool => _loginResponseBool;
  set loginResponseBool(bool newState) {
    _loginResponseBool = newState;
    notifyListeners();
  }

  bool _responseBool = false;
  bool get responseBool => _responseBool;
  set responseBool(bool newState) {
    _responseBool = newState;
    notifyListeners();
  }

  bool _responseBoolOrder = true;//false
  bool get responseBoolOrder => _responseBoolOrder;
  set responseBoolOrder(bool newState) {
    _responseBoolOrder = newState;
    notifyListeners();
  }

  bool? _loggeIn;
  bool get loggeIn => _loggeIn ?? false;
  set loggeIn(bool newState) {
    _loggeIn = newState;
    notifyListeners();
  }

  Future<bool> userLogin(LoginModel model) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    processing = true;
    bool response = await TachServiseAuth().login(model);
    processing = false;

    loginResponseBool= response;

    loggeIn = prefs.getBool('isLogged') ?? false;

    return response;
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('userPhNumber');
    prefs.remove('userFirstName');
    prefs.remove('userLastName');
    prefs.setBool('isLogged', false);
    loggeIn = prefs.getBool('isLogged') ?? false;

  }

  Future<bool> registerUser(RegisterModel model) async{
    responseBool = await TachServiseAuth().signup(model);
    return responseBool;
  }

  Future<bool> orderPush(OrderModel model) async{
    responseBoolOrder = await TachServiceOrder().orderPost(model);
    return responseBoolOrder;
  }

  getPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loggeIn = prefs.getBool('isLogged') ?? false;
  }
}
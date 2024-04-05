// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String phoneNumber;
  String password;

  LoginModel({
    required this.phoneNumber,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    phoneNumber: json["PhoneNumber"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "PhoneNumber": phoneNumber,
    "Password": password,
  };
}


LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  dynamic message;
  String phoneNumber;
  String userId;
  String firstName;
  String lastName;
  String address;
  String token;

  LoginResponseModel({
    required this.message,
    required this.phoneNumber,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    message: json["message"],
    phoneNumber: json["phoneNumber"],
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    address: json["address"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "phoneNumber": phoneNumber,
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "address": address,
    "token": token,
  };
}

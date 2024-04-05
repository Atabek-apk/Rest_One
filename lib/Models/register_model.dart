// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  String password;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    firstName: json["FirstName"],
    lastName: json["LastName"],
    address: json["Address"],
    phoneNumber: json["PhoneNumber"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "Address": address,
    "PhoneNumber": phoneNumber,
    "Password": password,
  };
}

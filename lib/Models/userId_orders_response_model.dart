// To parse this JSON data, do
//
//     final userIdOrdersResponse = userIdOrdersResponseFromJson(jsonString);

import 'dart:convert';

List<UserIdResponseOrders> userIdOrdersResponseFromJson(String str) => List<UserIdResponseOrders>.from(json.decode(str).map((x) => UserIdResponseOrders.fromJson(x)));

String userIdOrdersResponseToJson(List<UserIdResponseOrders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserIdResponseOrders {
  int id;
  dynamic firstName;
  dynamic lastName;
  String phoneNumber;
  String address;
  int orderStatusId;
  dynamic orderStatus;
  DateTime createdAt;
  DateTime orderApprovedAt;
  DateTime orderDeliveredCarrierDate;
  List<OrderItemDto> orderItemDto;

  UserIdResponseOrders({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.orderStatusId,
    required this.orderStatus,
    required this.createdAt,
    required this.orderApprovedAt,
    required this.orderDeliveredCarrierDate,
    required this.orderItemDto,
  });

  factory UserIdResponseOrders.fromJson(Map<String, dynamic> json) => UserIdResponseOrders(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    orderStatusId: json["orderStatusId"],
    orderStatus: json["orderStatus"],
    createdAt: DateTime.parse(json["createdAt"]),
    orderApprovedAt: DateTime.parse(json["orderApprovedAt"]),
    orderDeliveredCarrierDate: DateTime.parse(json["orderDeliveredCarrierDate"]),
    orderItemDto: List<OrderItemDto>.from(json["orderItemDTO"].map((x) => OrderItemDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "address": address,
    "orderStatusId": orderStatusId,
    "orderStatus": orderStatus,
    "createdAt": createdAt.toIso8601String(),
    "orderApprovedAt": orderApprovedAt.toIso8601String(),
    "orderDeliveredCarrierDate": orderDeliveredCarrierDate.toIso8601String(),
    "orderItemDTO": List<dynamic>.from(orderItemDto.map((x) => x.toJson())),
  };
}

class OrderItemDto {
  int productId;
  int quantity;

  OrderItemDto({
    required this.productId,
    required this.quantity,
  });

  factory OrderItemDto.fromJson(Map<String, dynamic> json) => OrderItemDto(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}

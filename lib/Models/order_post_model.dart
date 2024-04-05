import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String phoneNumber;
  String address;
  List<OrderItemDto> orderItemDto;

  OrderModel({
    required this.phoneNumber,
    required this.address,
    required this.orderItemDto,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    orderItemDto: List<OrderItemDto>.from(json["orderItemDTO"].map((x) => OrderItemDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "address": address,
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

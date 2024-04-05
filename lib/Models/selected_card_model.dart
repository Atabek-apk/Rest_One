import 'package:rest_one/constants/file_assistans.dart';

var uuid = const Uuid();

class CartModel {
  final String id;
  final TachProduct product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  }) : id = uuid.v4();
}


class FavoriModel {
  final String id;
  final TachProduct product;

  FavoriModel({
    required this.product,
  }) : id = uuid.v4();
}

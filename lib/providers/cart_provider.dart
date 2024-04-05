import 'package:rest_one/Models/selected_card_model.dart';
import 'package:rest_one/constants/file_assistans.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _shoppingCart = [];


  void addToCart(TachProduct product) {
    var isExist = _shoppingCart.where((element) => element.product.id == product.id);
    if (isExist.isEmpty) {
      _shoppingCart.add(CartModel(
        product: product,
        quantity: 1,
      ));
    } else {
      isExist.first.quantity += 1;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _shoppingCart.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
  void clearItem() {
    _shoppingCart.clear();
    notifyListeners();
  }

  void incrementQty(String productId) {
    CartModel item =
        _shoppingCart.where((element) => element.id == productId).first;
    item.quantity++;
    notifyListeners();
  }

  int getProductTotal() {
    int quantitys = 0;
    for(var cartItem in _shoppingCart) {
      quantitys += cartItem.quantity;
    }
    return quantitys;
  }

  void decrimentQty(String productId) {
    CartModel item =
        _shoppingCart.where((element) => element.id == productId).first;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _shoppingCart.remove(item);
    }
    notifyListeners();
  }

  double getCartTotal() {
    double total = 0;
    for(var cartItem in _shoppingCart) {
      total += (cartItem.product.regularPrice * cartItem.quantity);
    }
    return total;
  }

  List<CartModel> get shoppingCart => _shoppingCart;
  double get cartSubTotal => getCartTotal();
  int get cartProductTotal => getProductTotal();
  double get shippingCharge => 15;
  double get cartTotal => cartSubTotal + shippingCharge;
}

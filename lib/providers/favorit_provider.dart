import 'package:rest_one/constants/file_assistans.dart';

class FavoriteProduct extends ChangeNotifier {

  List<TachProduct> _likes = [];
  List<TachProduct> get like => _likes;

  void pressButton(TachProduct product){
    final isExist = _likes.contains(product);
    if(isExist){
      _likes.remove(product);
    }else{
      _likes.add(product);
    }
    notifyListeners();
  }

  bool isExist(TachProduct like){
    final isExist = _likes.contains(like);
    return isExist;
  }
}

import 'package:rest_one/constants/file_assistans.dart';

class MenuPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MenuPageController());
  }
}
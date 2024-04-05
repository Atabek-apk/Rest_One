import 'package:rest_one/constants/file_assistans.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.menuPage,
        page: () => BottomPage(),
        binding: MenuPageBinding()),
  ];
}

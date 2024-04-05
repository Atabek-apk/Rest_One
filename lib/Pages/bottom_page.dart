import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

List<Widget> screens() {
  return [
    MenuPage(),
    ShopPage(),
    FavoriPage(),
    SettingsPage(),
  ];
}

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: PersistentTabView(context,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 750),
            curve: Curves.ease,
          ),
          screens: screens(),
          items: [
            PersistentBottomNavBarItem(
              icon: Icon(
                Iconsax.menu_board,
                size: 22,
              ),
              title: 'Menu',
              textStyle: TextStyle(fontSize: 12, fontFamily: 'Bold'),
              activeColorPrimary: Colors.deepOrangeAccent,
              inactiveColorPrimary: Colors.orangeAccent,
            ),
            PersistentBottomNavBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: Icon(
                      Iconsax.bag_happy,
                      size: 22,
                    ),
                  ),
                  Positioned(
                    top: -5,
                    right: 1,
                    child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                        ? CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 7,
                      child: Text(
                        context
                            .watch<CartProvider>()
                            .shoppingCart
                            .length
                            .toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                        : const SizedBox(),
                  ),
                ],
              ),
              title: "Sebet",
              textStyle: TextStyle(fontSize: 13, fontFamily: 'Bold'),
              activeColorPrimary: Colors.deepOrangeAccent,
              inactiveColorPrimary: Colors.orangeAccent,
            ),
            PersistentBottomNavBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Iconsax.heart_add,
                    size: 22,
                  ),
                  Positioned(
                    top: -5,
                    right: 1,
                    child: context.watch<FavoriteProduct>().like.isNotEmpty
                        ? CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 7,
                      child: Text(
                        context
                            .watch<FavoriteProduct>()
                            .like
                            .length
                            .toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                        : const SizedBox(),
                  ),
                ],
              ),
              title: "Halanlarym",
              textStyle: TextStyle(fontSize: 12, fontFamily: 'Bold'),
              activeColorPrimary: Colors.deepOrangeAccent,
              inactiveColorPrimary: Colors.orangeAccent,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(
                Iconsax.setting_2,
                size: 22,
              ),
              title: "Sazlama",
              textStyle: TextStyle(fontSize: 12, fontFamily: 'Bold'),
              activeColorPrimary: Colors.deepOrangeAccent,
              inactiveColorPrimary: Colors.orangeAccent,
            ),
          ],
          navBarStyle: NavBarStyle.style8),
    );
  }
}

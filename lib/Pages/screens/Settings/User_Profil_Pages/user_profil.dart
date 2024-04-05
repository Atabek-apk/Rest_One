import 'package:rest_one/Pages/screens/Settings/Orders_Page/order_page.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/providers/login_provider.dart';
import 'non_user_profil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  String userNymber = "";
  String userFirstName = "";
  String userLastName = "";
  String userAddress = "";
  Future<void> text() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userNymber = prefs.getString('userPhNumber')!;
    userFirstName = prefs.getString('userFirstName')!;
    userLastName = prefs.getString('userLastName')!;
    userAddress = prefs.getString('userAddress')!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text();
  }

  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<LoginNotifier>(context);
    return authNotifier.loggeIn == false
        ? NonUserProfil()
        : Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
            return Scaffold(
              appBar: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.orange[300],
                elevation: 2,
                title: Text(getTranslated(context, 'sazlama')!,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Regular',
                        color: Colors.white)),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              child: CircleAvatar(
                                backgroundColor: Colors.orange[400],
                                backgroundImage:
                                    AssetImage('assets/images/tr.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${userLastName} ${userFirstName}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          // color: Theme.of(context).accentColor,
                                          fontFamily: 'Regular'),
                                    ),
                                    Text(
                                      "+993${userNymber}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          // color: Theme.of(context).accentColor,
                                          fontFamily: 'Regular'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => UserOrdersPage(),),
                          );
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => UserOrdersPage()));
                        },
                        child: Container(
                          height: 60,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "Sargytlarym",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // color: Theme.of(context).accentColor,
                                        fontFamily: 'Regular'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          themeNotifier.isDark
                              ? themeNotifier.isDark = false
                              : themeNotifier.isDark = true;
                        },
                        child: Container(
                          height: 60,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    themeNotifier.isDark
                                        ? getTranslated(context, 'gijeki_fon')!
                                        : getTranslated(
                                            context, 'gundizki_fon')!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // color: Theme.of(context).accentColor,
                                        fontFamily: 'Regular'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: Icon(
                                    themeNotifier.isDark
                                        ? Icons.nightlight_round
                                        : Icons.wb_sunny,
                                    color: Theme.of(context).bottomAppBarColor,
                                    size: 27,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 60,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<Language>(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      getTranslated(
                                          context, 'change_language')!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          // color: Theme.of(context).accentColor,
                                          fontFamily: 'Regular'),
                                    ),
                                  ),
                                ],
                              ),
                              items: Language.languageList()
                                  .map((Language item) =>
                                      DropdownMenuItem<Language>(
                                          value: item,
                                          child: Row(
                                            children: [
                                              Text(
                                                item.flag,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    // color: Theme.of(context)
                                                    //     .accentColor
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                item.name,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    // color: Theme.of(context)
                                                    //     .accentColor,
                                                    fontFamily: 'Regular'),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )))
                                  .toList(),
                              onChanged: (Language? language) {
                                _changeLanguage(language!);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 60,
                                padding: const EdgeInsets.only(right: 15),
                              ),
                              iconStyleData: IconStyleData(
                                icon: Text(
                                  getTranslated(context, 'language')!,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      // color: Theme.of(context).accentColor,
                                      fontFamily: 'Regular'),
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          authNotifier.logout();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NonUserProfil()));
                        },
                        child: Container(
                          height: 60,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "Çykmak",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // color: Theme.of(context).accentColor,
                                        fontFamily: 'Regular'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      QrImage(
                        data:
                            "Ady: ${userLastName}\nFamiliyasy: ${userFirstName}\nNomery: +993${userNymber}\nAddress: ${userAddress}",
                        size: 200,
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: Size(100, 100),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
  }
}

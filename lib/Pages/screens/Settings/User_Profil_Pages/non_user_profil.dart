import 'package:rest_one/constants/file_assistans.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NonUserProfil extends StatefulWidget {
  const NonUserProfil({Key? key}) : super(key: key);

  @override
  State<NonUserProfil> createState() => _NonUserProfilState();
}

class _NonUserProfilState extends State<NonUserProfil> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);

    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
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
                  fontSize: 25, fontFamily: 'Regular', color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                ZoomTapAnimation(
                  child: Container(
                    height: 65,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "Ulgama gir",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    // color: Theme.of(context).accentColor,
                                    fontFamily: 'Regular'),
                              ),
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
                    height: 65,
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
                                  : getTranslated(context, 'gundizki_fon')!,
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
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<Language>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              getTranslated(context, 'change_language')!,
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
                          .map((Language item) => DropdownMenuItem<Language>(
                              value: item,
                              child: Row(
                                children: [
                                  Text(
                                    item.flag,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // color: Theme.of(context).accentColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        // color: Theme.of(context).accentColor,
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
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 270,
                  width: 270,
                  child: Image.asset(
                    'assets/images/tr.png',
                    color: Colors.orange.shade300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Täç coffee',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.orange.shade300,
                        fontFamily: 'Italic'),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

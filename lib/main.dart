import 'dart:io';
import 'package:grock/grock.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:http/http.dart' as http;
import 'package:rest_one/providers/login_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding= WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp();
  // await FirebaseApi().initNotifcation();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _postToken();
    FlutterNativeSplash.remove();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProduct()),
        ChangeNotifierProvider(create: (_) => LoginNotifier()),
      ],
      child: ChangeNotifierProvider(
          create: (_) => ModelTheme(),
          child: Consumer<ModelTheme>(
              builder: (context, ModelTheme themeNotifier, child) {
                return  GetMaterialApp(
                  title: 'Täç coffee',
                  navigatorKey: Grock.navigationKey,
                  scaffoldMessengerKey: Grock.scaffoldMessengerKey,
                  debugShowCheckedModeBanner: false,
                  theme: themeNotifier.isDark
                      ? ThemeData(
                      brightness: Brightness.dark,
                      //tema
                      primarySwatch: Colors.blueGrey,
                      //button
                      primaryColor: Colors.blueGrey,
                      // home 50/50 Background
                      //text color
                      dividerColor: Colors.white,
                      splashColor: Colors.white,
                      bottomAppBarColor: Colors.white
                    //sazlama icon
                  )
                      : ThemeData(
                      brightness: Brightness.light,
                      //tema
                      primarySwatch: Colors.orange,
                      //button
                      primaryColor: Colors.blue,
                      // home 50/50 Background
                      // text color
                      dividerColor: Colors.white,
                      splashColor: Colors.transparent, //sazlama icon
                      bottomAppBarColor: Colors.yellow
                  ),
                  locale: _locale,
                  localizationsDelegates: const [
                    DemoLocalization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale("tr", "TR"),
                    Locale("ru", "RU"),
                    Locale("en", "EN"),
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode == locale?.languageCode &&
                          supportedLocale.countryCode == locale?.countryCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  getPages: AppPage.list,
                  initialRoute: AppRoute.menuPage,
                );
              }
          )),
    );
  }
}

Future<Object> _postToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? devtoken = prefs.getString('devToken');
  final deviceTokenFCM = await _firebaseMessaging.getToken();
  await http.post(Uri.parse("${baseurl}/api/userapi/token"),
      headers: {'Content-Type':'application/json'},
      body: jsonEncode({"token":deviceTokenFCM}));
  await prefs.setString('devToken', '$deviceTokenFCM');
  print('Device Token not Sended');
  return true;
}

  // Future<Object> _postToken() async {
  //  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  //  var devtoken = prefs.getString('devToken');
  //  if(devtoken.isNull){
  //    final deviceTokenFCM = await _firebaseMessaging.getToken();
  //    await http.post(Uri.parse('https://192.168.163.1:5001/api/userapi/token'),
  //        headers: {'Content-Type':'application/json'},
  //        body: jsonEncode({"token":deviceTokenFCM}));
  //    await prefs.setString('devToken', '$deviceTokenFCM');
  //    print('Device Token ready');
  //    return true;
  //  } else{
  //    print('Token sent and saved;');
  //    return true;
  //  }
  // }
  // print('Ahmet sana token22222 : ${deviceTokenFCM}');
  // print('Ahmet sana token3333 : ${deviceTokenFCM?.length}');


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

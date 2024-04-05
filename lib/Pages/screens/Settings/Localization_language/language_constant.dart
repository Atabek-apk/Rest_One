import 'package:rest_one/constants/file_assistans.dart';

const String LAGUAGE_CODE = 'languageCode';

const String RUSSIAN = 'ru';
const String TURKEY = 'tr';
const String ENGLISH = 'en';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LAGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "tr";

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case RUSSIAN:
      return Locale(RUSSIAN, 'RU');

    case TURKEY:
      return Locale(TURKEY, "TR");

    case ENGLISH:
      return Locale(ENGLISH, "EN");

    default:
      return Locale(TURKEY, 'TR');
  }
}

String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)?.translate(key);
}



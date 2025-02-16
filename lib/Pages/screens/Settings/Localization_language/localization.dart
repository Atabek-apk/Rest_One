import 'package:rest_one/constants/file_assistans.dart';

class DemoLocalization {

  DemoLocalization(this.locale);

  final Locale locale;

  static DemoLocalization? of(BuildContext context) {

    return Localizations.of<DemoLocalization>(context, DemoLocalization);

  }

  Map<String, String>? _localizedValues;

  Future<void> load() async {

    String jsonStringValues =

    await rootBundle.loadString('assets/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues =

        mappedJson.map((key, value) => MapEntry(key, value.toString()));

  }

  String? translate(String key) {

    return _localizedValues![key];

  }

  static const LocalizationsDelegate<DemoLocalization> delegate =

  _DemoLocalizationsDelegate();

}

class _DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'tr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization localization = new DemoLocalization(locale);

    await localization.load();

    return localization;
  }

  @override

  bool shouldReload(LocalizationsDelegate<DemoLocalization> old) => false;
}



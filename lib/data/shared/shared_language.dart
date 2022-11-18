import 'package:shared_preferences/shared_preferences.dart';

class SharedLanguage {
  static const String languageKey = "languageKey";

  static Future<String> getLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String language = preferences.getString(languageKey) ?? "en";
    return language;
  }

  static Future setLanguage({required String language}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(languageKey, language);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

//String
Future<void> saveStringValue({String key, String value}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.setString(key, value);
}

Future<String> getStringValue({String key}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString(key);
}

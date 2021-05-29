import 'dart:convert';

import 'package:foodie_delivery/services/apiUrls.dart';
import 'package:foodie_delivery/services/sharedPreference.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String email, String password) async {
  // var url =
  //     Uri.parse('https://foodiedeliveryapp.herokuapp.com/api/user/signin');
  var url = Uri.parse(ApiUrls.deliveryBoyLogin);
  print(url);
  String token;

  saveStringValue(key: 'email', value: email ?? '');

  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": email, "password": password}));
  if (response.statusCode == 200) {
    print(response.body);
    token = response.body.toString();
    saveStringValue(key: 'token', value: token);

    return true;
  } else {
    print(response.statusCode);
    token = '';

    return false;
  }
}

Future<bool> getLoginStatus() async {
  String token = '';
  await getStringValue(key: 'token').then((value) {
    token = value ?? '';
  });
  if (token == "") {
    return false;
  } else
    return true;
}

Future<void> removeToken() async {
  final prefs = await SharedPreferences.getInstance();

  prefs.remove('token');
}

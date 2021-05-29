import 'dart:convert';

import 'package:foodieshop/services/apiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String email, String password) async {
  // var url = Uri.parse('https://foodiehotel.herokuapp.com/hotel/login');
  var url = Uri.parse(ApiUrls.hotelLogin);

  // var url = Uri.parse('https://foodie-main.herokuapp.com/hotel/hotel/login');
  print(url);
  String token;
  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"Email": email, "Password": password}));
  if (response.statusCode == 200) {
    print(response.body);

    token = response.body.toString();
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    // set value
    prefs.setString('token', token);

    return true;
  } else {
    print(response.statusCode);
    token = null;
    return false;
  }
}

Future<bool> getLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
  final token = prefs.getString('token') ?? "";
  if (token == "" || token.length <= 10) {
    return false;
  } else
    return true;
}

Future<void> removeToken() async {
  final prefs = await SharedPreferences.getInstance();

  prefs.remove('token');
}

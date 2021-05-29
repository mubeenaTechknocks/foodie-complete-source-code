import 'dart:convert';

import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<UserModel> getUserDetails(String email) async {
  var url = Uri.parse(ApiUrls.getDeliveryboyDetails);
  var response = await http.post(url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": email}));
  if (response.statusCode == 200) {
    var body = userModelFromJson(response.body);
    return body;
  } else {
    throw Exception('failed to load');
  }
}

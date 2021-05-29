import 'dart:convert';

import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;

//recieves an id and a string with function call
//string which has to be updated in the DB
Future<bool> editsubadmin(String name, String id) async {
  var url = Uri.parse(ApiUrls.subAdmin + '/$id');

  // var url = Uri.https(
  //     'foodie-main.herokuapp.com', 'admin/subadmin/$id', {'q': '{http}'});

  final response = await http.patch(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //body should be encoded to json using "jsonEncode" function
      body: jsonEncode({'Name': name}));
  if (response.statusCode == 200) {
    //Decode response body as per the needs or just leave it there
    return true;
  } else {
    return false;
  }
}

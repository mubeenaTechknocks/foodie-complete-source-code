import 'dart:convert';
import 'package:foodieadmin/model/subadminmodels.dart';
import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<Subadminals> postdata(
    {String name,
    String contactnumber,
    String address,
    String pincode,
    String email,
    String password}) async {
  var url = Uri.parse(ApiUrls.subAdmin);
  // var url = Uri.https("foodie-main.herokuapp.com", "admin/subadmin/");
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "Name": name,
      "Contactnumber": contactnumber,
      "Address": address,
      "Pincode": pincode,
      "Email": email,
      "Password": password
    }),
    // body: jsonEncode(<String, dynamic>{
    //   "Hotelsname": name,
    //   "Contactnumber": contactnumber,
    //   "Pincode": pincode,
    //   "Address": address,
    //   "Email": email,
    //   "Password": password
    // }),
  );
  if (response.statusCode == 200) {
    print('Posted');
    print(response.statusCode);
    // var responseBody = Shop.fromJson(jsonDecode(response.body));
    // return responseBody;
    return Subadminals.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Failed to post');
  }
}

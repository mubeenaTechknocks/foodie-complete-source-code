import 'dart:convert';
import 'dart:io';
import 'package:foodieadmin/forgotPassword/services/exceptions.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  Future<dynamic> postData(String url, dynamic body) async {
    var jsonResponse;
    var uri = Uri.parse(url);
    try {
      final response = await http.post(uri,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: body);
      jsonResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return jsonResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

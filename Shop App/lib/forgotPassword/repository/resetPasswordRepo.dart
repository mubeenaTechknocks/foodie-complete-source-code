import 'dart:convert';

import 'package:foodieshop/forgotPassword/services/ApiHelper.dart';
import 'package:foodieshop/models/response.dart';
import 'package:foodieshop/services/apiUrls.dart';

class ResetPasswordRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> resetPassword(String email, password) async {
    var body = jsonEncode({"email": email, "password": password});
    final response =
        await _apiHelper.postData(ApiUrls.hotelRPRupdatePassword, body);

    return Response.fromJson(response);
  }
}

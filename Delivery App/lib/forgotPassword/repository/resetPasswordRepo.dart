import 'dart:convert';

import 'package:foodie_delivery/forgotPassword/services/ApiHelper.dart';
import 'package:foodie_delivery/models/response.dart';
import 'package:foodie_delivery/services/apiUrls.dart';

class ResetPasswordRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> resetPassword(String email, password) async {
    var body = jsonEncode({"email": email, "password": password});
    final response =
        await _apiHelper.postData(ApiUrls.deliveryRPRupdatePassword, body);

    return Response.fromJson(response);
  }
}

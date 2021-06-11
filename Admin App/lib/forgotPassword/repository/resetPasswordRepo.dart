import 'dart:convert';

import 'package:foodieadmin/forgotPassword/services/ApiHelper.dart';
import 'package:foodieadmin/model/response.dart';
import 'package:foodieadmin/services/apiUrls.dart';

class ResetPasswordRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> resetPassword(String email, password) async {
    var body = jsonEncode({"email": email, "password": password});
    final response =
        await _apiHelper.postData(ApiUrls.adminRPRupdatePassword, body);

    return Response.fromJson(response);
  }
}

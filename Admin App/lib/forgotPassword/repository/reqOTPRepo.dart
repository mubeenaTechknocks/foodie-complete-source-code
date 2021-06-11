import 'dart:convert';

import 'package:foodieadmin/forgotPassword/services/ApiHelper.dart';
import 'package:foodieadmin/model/response.dart';
import 'package:foodieadmin/services/apiUrls.dart';

class ReqOTPRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> reqOTP(String email) async {
    var body = jsonEncode({"email": email});
    final response = await _apiHelper.postData(ApiUrls.adminRPROtp, body);

    return Response.fromJson(response);
  }
}

import 'dart:convert';

import 'package:foodieadmin/forgotPassword/services/ApiHelper.dart';
import 'package:foodieadmin/model/response.dart';
import 'package:foodieadmin/services/apiUrls.dart';

class VerifyOTPRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> verifyOTP(String email, otp) async {
    var body = jsonEncode({"email": email, "otp": otp});
    final response = await _apiHelper.postData(ApiUrls.adminRPRVerifyOtp, body);

    return Response.fromJson(response);
  }
}

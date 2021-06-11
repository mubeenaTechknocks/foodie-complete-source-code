import 'dart:convert';

import 'package:foodieshop/forgotPassword/services/ApiHelper.dart';
import 'package:foodieshop/models/response.dart';
import 'package:foodieshop/services/apiUrls.dart';

class VerifyOTPRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> verifyOTP(String email, otp) async {
    var body = jsonEncode({"email": email, "otp": otp});
    final response = await _apiHelper.postData(ApiUrls.hotelRPRVerifyOtp, body);

    return Response.fromJson(response);
  }
}

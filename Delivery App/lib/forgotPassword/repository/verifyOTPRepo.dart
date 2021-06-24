import 'dart:convert';

import 'package:foodie_delivery/forgotPassword/services/ApiHelper.dart';
import 'package:foodie_delivery/models/response.dart';
import 'package:foodie_delivery/services/apiUrls.dart';

class VerifyOTPRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> verifyOTP(String email, otp) async {
    var body = jsonEncode({"email": email, "otp": otp});
    final response =
        await _apiHelper.postData(ApiUrls.deliveryRPRVerifyOtp, body);

    return Response.fromJson(response);
  }
}

import 'dart:convert';

import 'package:foodieshop/forgotPassword/services/ApiHelper.dart';
import 'package:foodieshop/models/response.dart';
import 'package:foodieshop/services/apiUrls.dart';

class ReqOTPRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> reqOTP(String email) async {
    var body = jsonEncode({"email": email});
    final response = await _apiHelper.postData(ApiUrls.hotelRPROtp, body);

    return Response.fromJson(response);
  }
}

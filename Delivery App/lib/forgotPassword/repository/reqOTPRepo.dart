import 'dart:convert';

import 'package:foodie_delivery/forgotPassword/services/ApiHelper.dart';
import 'package:foodie_delivery/models/response.dart';
import 'package:foodie_delivery/services/apiUrls.dart';

class ReqOTPRepo {
  APIHelper _apiHelper = APIHelper();

  Future<Response> reqOTP(String email) async {
    var body = jsonEncode({"email": email});
    final response = await _apiHelper.postData(ApiUrls.deliveryRPROtp, body);

    return Response.fromJson(response);
  }
}

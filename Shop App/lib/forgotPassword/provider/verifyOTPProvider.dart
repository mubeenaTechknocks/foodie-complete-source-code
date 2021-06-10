import 'package:flutter/material.dart';
import 'package:foodieshop/forgotPassword/ui/requestOTPpage.dart';

class VerifyOTPProvider {
  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RequestOTPScreen()));
  }
}

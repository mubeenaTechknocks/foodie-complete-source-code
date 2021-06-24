import 'package:flutter/material.dart';
import 'package:foodie_delivery/forgotPassword/repository/verifyOTPRepo.dart';
import 'package:foodie_delivery/forgotPassword/services/apiGEneric.dart';
import 'package:foodie_delivery/forgotPassword/ui/paswwordResetScreen.dart';
import 'package:foodie_delivery/models/response.dart';

class VerifyOTPProvider with ChangeNotifier {
  String _otp = '';
  bool _isLoading = false;
  bool _status = true;
  ApiResponse<Response> _response;

  ///TO get otp from this provider
  String get otp => _otp;

  ///Boolean for setting loading status
  bool get isLoading => _isLoading;

  ///Boolean for the status of the response
  bool get status => _status;

  ///Api response from the server
  ApiResponse<Response> get response => _response;

  ///Setter for the otp
  set setOTP(String value) {
    _otp = value;
  }

  void onButtontap(BuildContext context, String email) async {
    _status = true;
    VerifyOTPRepo _verifyOTPRepo = VerifyOTPRepo();
    _isLoading = true;
    notifyListeners();
    try {
      Response resp = await _verifyOTPRepo.verifyOTP(email, otp);

      if (resp.status) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PasswordResetPage()));
      } else {
        _status = false;
        _response = ApiResponse.completed(resp);
      }
    } catch (e) {
      _response = ApiResponse.error(e.toString());
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    )
                  ],
                  title: Text('No internet Connection'),
                  content: Text(_response.message +
                      '. Check your connection and try again.')));
    }
    _isLoading = false;
    notifyListeners();
  }
}

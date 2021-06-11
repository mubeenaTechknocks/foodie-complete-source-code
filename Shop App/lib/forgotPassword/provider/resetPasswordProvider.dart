import 'package:flutter/material.dart';
import 'package:foodieshop/forgotPassword/repository/resetPasswordRepo.dart';
import 'package:foodieshop/forgotPassword/services/apiGEneric.dart';
import 'package:foodieshop/goldPages/login.dart';
import 'package:foodieshop/models/response.dart';

class ResetPasswordProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _status = true;
  ApiResponse<Response> _response;

  ///Boolean for setting loading status
  bool get isLoading => _isLoading;

  ///Boolean for the status of the response
  bool get status => _status;

  ///Api response from the server
  ApiResponse<Response> get response => _response;

  void onButtontap(BuildContext context, String email, String password) async {
    _status = true;
    ResetPasswordRepo _verifyOTPRepo = ResetPasswordRepo();
    _isLoading = true;
    notifyListeners();
    try {
      Response resp = await _verifyOTPRepo.resetPassword(email, password);

      if (resp.status) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
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

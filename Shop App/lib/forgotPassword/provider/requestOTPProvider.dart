import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodieshop/forgotPassword/repository/reqOTPRepo.dart';
import 'package:foodieshop/forgotPassword/services/apiGEneric.dart';
import 'package:foodieshop/forgotPassword/ui/verifyOTPScreen.dart';
import 'package:foodieshop/models/response.dart';
import 'package:provider/provider.dart';

enum ReqOTPStates { DataCollection, Requesting, Success, Error }

class RequestOTPProvider with ChangeNotifier {
  String _email = '';
  bool _isLoading = false;
  bool _status = true;
  ApiResponse<Response> _response;

  ///TO get email from this provider
  String get email => _email;

  ///Boolean for setting loading status
  bool get isLoading => _isLoading;

  ///Boolean for the status of the response
  bool get status => _status;

  ///Api response from the server
  ApiResponse<Response> get response => _response;

  ///Setter for the email
  set setEmail(String value) {
    _email = value;
  }

  void onButtontap(BuildContext context) async {
    ReqOTPRepo _reqOTPRepo = ReqOTPRepo();
    _isLoading = true;
    notifyListeners();
    try {
      Response resp = await _reqOTPRepo.reqOTP(_email);

      if (resp.status) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerifyOTPScreen()));
      } else {
        _status = false;
        _response = ApiResponse.completed(resp);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => VerifyOTPScreen()));
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

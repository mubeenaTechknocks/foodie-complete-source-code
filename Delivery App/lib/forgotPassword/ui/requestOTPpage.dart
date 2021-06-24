import 'package:flutter/material.dart';
import 'package:foodie_delivery/forgotPassword/provider/requestOTPProvider.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:provider/provider.dart';

class RequestOTPScreen extends StatelessWidget {
  const RequestOTPScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                logo,
                width: 120,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              TextFormField(
                onChanged: (value) =>
                    context.read<RequestOTPProvider>().setEmail = value,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themegreen, width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: themegreen, width: 3)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Consumer<RequestOTPProvider>(builder: (_, request, __) {
                  return request.isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(themegreen),
                        )
                      : MaterialButton(
                          onPressed: () {
                            request.onButtontap(context);
                          },
                          minWidth: double.maxFinite,
                          height: 50,
                          color: themegreen,
                          child: Text(
                            'Send OTP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        );
                }),
              ),
              Consumer<RequestOTPProvider>(
                  builder: (_, provider, __) => provider.status
                      ? SizedBox()
                      : Text(
                          provider.response.data.msg,
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}

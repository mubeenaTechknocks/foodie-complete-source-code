import 'package:flutter/material.dart';
import 'package:foodieshop/forgotPassword/provider/requestOTPProvider.dart';
import 'package:foodieshop/forgotPassword/provider/verifyOTPProvider.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key key}) : super(key: key);

  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    String _email =
        Provider.of<RequestOTPProvider>(context, listen: false).email;
    return ChangeNotifierProvider(
      create: (context) => VerifyOTPProvider(),
      child: Scaffold(
        backgroundColor: themecolor,
        appBar: AppBar(
          backgroundColor: themecolor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Verification",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Enter the verification code received in your email address",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Consumer<VerifyOTPProvider>(
                    builder: (_, otp, __) => PinCodeTextField(
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                      appContext: context,
                      onChanged: (value) => otp.setOTP = value,
                      length: 6,
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      cursorColor: Colors.white,
                      pinTheme: PinTheme(
                        inactiveColor: themegreen,
                        selectedColor: themegreen,
                        shape: PinCodeFieldShape.box,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child:
                        Consumer<VerifyOTPProvider>(builder: (_, request, __) {
                      return request.isLoading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(themegreen),
                            )
                          : MaterialButton(
                              onPressed: () {
                                request.onButtontap(context, _email);
                              },
                              color: themegreen,
                              minWidth: 150,
                              height: 45,
                              child: Text(
                                "Submitt",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                    }),
                  ),
                  SizedBox(height: 18),
                  Center(
                    child: Consumer<VerifyOTPProvider>(
                        builder: (_, provider, __) => provider.status
                            ? SizedBox()
                            : Text(
                                provider.response.data.msg,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

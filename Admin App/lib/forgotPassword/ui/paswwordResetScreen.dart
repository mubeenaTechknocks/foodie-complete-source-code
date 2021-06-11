import 'package:flutter/material.dart';
import 'package:foodieadmin/forgotPassword/provider/requestOTPProvider.dart';
import 'package:foodieadmin/forgotPassword/provider/resetPasswordProvider.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:provider/provider.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key key}) : super(key: key);

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String _email =
        Provider.of<RequestOTPProvider>(context, listen: false).email;
    return ChangeNotifierProvider(
      create: (context) => ResetPasswordProvider(),
      child: Scaffold(
        backgroundColor: themecolor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: _formKey,
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
                        'Reset your password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  CustomTextField(
                    controller: _password,
                    hintText: 'Enter Your Password',
                    validator: (value) {
                      if (value.length < 8)
                        return "Password must be 8 characters long";
                      return null;
                    },
                  ),
                  SizedBox(height: 18),
                  CustomTextField(
                    controller: _confirm,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value != _password.text)
                        return "Password does not match";
                      return null;
                    },
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Consumer<ResetPasswordProvider>(
                        builder: (_, request, __) {
                      return request.isLoading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(themegreen),
                            )
                          : MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  request.onButtontap(
                                      context, _email, _password.text);
                                }
                              },
                              minWidth: double.maxFinite,
                              height: 50,
                              color: themegreen,
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            );
                    }),
                  ),
                  Consumer<ResetPasswordProvider>(
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
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;
  const CustomTextField(
      {Key key, this.controller, this.hintText, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[700]),
        fillColor: Color.fromRGBO(16, 16, 16, 8),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themegreen, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themegreen, width: 1.5)),
      ),
    );
  }
}

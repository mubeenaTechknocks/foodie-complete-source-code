import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie_delivery/forgotPassword/ui/requestOTPpage.dart';
import 'package:foodie_delivery/pages/home.dart';
import 'package:foodie_delivery/pages/signupCredentials.dart';
import 'package:foodie_delivery/services/login.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/LoginPage/commonbutton.dart';
import 'package:foodie_delivery/widgets/LoginPage/passwordfield.dart';
import 'package:foodie_delivery/widgets/LoginPage/textBoxNew.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  String _errorText = '';

  bool clicked = false;
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Padding(padding: EdgeInsets.only(top: 130)),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/logowithcaption.png",
                  width: 200,
                  height: 100,
                ),
                // color: Colors.red,
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: width,
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.red,
                    width: width,
                    child: TitleText(title: "LOG IN"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  TextBoxNew(
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    hint: 'Email',
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  PasswordField(
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    hint: 'Password',
                  ),
                  _error
                      ? Padding(
                          child: Text(
                            _errorText,
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w800),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 22))
                      : Padding(padding: EdgeInsets.only(top: 45)),
                  clicked
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(themegreenlight),
                        )
                      : CommonButton(
                          title: "LOG IN",
                          onPressed: () {
                            setState(() {
                              clicked = true;
                            });
                            print('login pressed');
                            login(_email, _password).then((value) {
                              print(value);
                              if (value == 'true') {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Home(
                                    activeOrder: false,
                                  );
                                }));

                                // showError();
                              } else {
                                print('Login Failed');
                                setState(() {
                                  _errorText = value;
                                  _error = true;
                                  clicked = !clicked;
                                });
                              }
                            });
                          },
                        ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    alignment: Alignment.centerRight,
                    width: double.maxFinite,
                    child: CustomTextButton(
                      btText: 'Forgot password?',
                      color: Colors.grey[800],
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RequestOTPScreen()));
                      },
                    ),
                  )
                ]),
              ),
            ]),
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  CustomTextButton(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SignupCredentials()));
                      },
                      btText: 'Register',
                      color: Colors.green[700]),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final void Function() onTap;
  final String btText;
  final Color color;
  const CustomTextButton({
    Key key,
    this.onTap,
    this.btText,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Text(
          btText,
          style: TextStyle(color: color, fontWeight: FontWeight.w800),
        ));
  }
}

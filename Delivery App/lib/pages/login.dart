import 'dart:ui';

import 'package:flutter/material.dart';
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

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                Padding(padding: EdgeInsets.only(top: 45)),
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
                            if (value == false) {
                              print('Login Failed');
                              setState(() {
                                clicked = !clicked;
                              });
                              // showError();
                            } else {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Home(
                                  activeOrder: false,
                                );
                              }));
                            }
                          });
                        },
                      ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignupCredentials()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.green[800],
                              fontWeight: FontWeight.w800),
                        )),
                  ],
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

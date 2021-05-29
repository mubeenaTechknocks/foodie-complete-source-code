import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/admin.dart';
import 'package:foodieshop/goldWidgets/adminText.dart';
import 'package:foodieshop/goldWidgets/btForgetPassword.dart';
import 'package:foodieshop/goldWidgets/colorButton.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/goldWidgets/passwordBox.dart';
import 'package:foodieshop/goldWidgets/textBox.dart';
import 'package:foodieshop/services/loginService.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wd = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: themecolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.maxFinite,
          height: ht > wd ? ht : wd,
          child: wd > 1000
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Image.asset(
                        logo,
                        width: 180,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AdminText(
                                  width: wd / 2,
                                ),
                                TextBox1(
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  width: wd / 2,
                                  margin: EdgeInsets.symmetric(vertical: 25),
                                  hintText: 'Email',
                                  autoCorrect: false,
                                ),
                                PasswordBox(
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  width: wd / 2,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ColorButton(
                                      buttonAction: () {
                                        print('login Clicked');
                                        login(email, password).then((value) {
                                          if (value == false) {
                                            print('Login Failed');

                                            // showError();
                                          } else {
                                            Navigator.pushReplacement(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation1,
                                                        animation2) =>
                                                    Admin(),
                                                transitionDuration:
                                                    Duration(seconds: 0),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      buttonColor: themegreen,
                                      padding: EdgeInsets.symmetric(
                                          vertical: (15), horizontal: 180),
                                      buttonText: 'LOG IN',
                                    ),
                                    CustomTextButton(),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ])
              : Column(
                  mainAxisAlignment: ht < 500
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Image.asset(
                        logo,
                        width: 180,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AdminText(),
                                TextBox1(
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  margin: EdgeInsets.symmetric(vertical: 25),
                                  hintText: 'Email',
                                  autoCorrect: false,
                                ),
                                PasswordBox(
                                  onChanged: (value) {
                        
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                ),
                                wd > 750
                                    ? SizedBox(
                                        width: double.maxFinite,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ColorButton(
                                                buttonAction: () {
                                                  print('login Clicked');
                                                  login(email, password)
                                                      .then((value) {
                                                    if (value == false) {
                                                      print('Login Failed');

                                                      // showError();
                                                    } else {
                                                      Navigator.pushReplacement(
                                                        context,
                                                        PageRouteBuilder(
                                                          pageBuilder: (context,
                                                                  animation1,
                                                                  animation2) =>
                                                              Admin(),
                                                          transitionDuration:
                                                              Duration(
                                                                  seconds: 0),
                                                        ),
                                                      );
                                                    }
                                                  });
                                                },
                                                buttonColor: themegreen,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: (15),
                                                    horizontal: 180),
                                                buttonText: 'LOG IN',
                                              ),
                                              CustomTextButton(),
                                            ]),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextButton(),
                                          ColorButton(
                                            buttonAction: () {
                                              print('login Clicked');
                                              login(email, password)
                                                  .then((value) {
                                                if (value == false) {
                                                  print('Login Failed');

                                                  // showError();
                                                } else {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation1,
                                                              animation2) =>
                                                          Admin(),
                                                      transitionDuration:
                                                          Duration(seconds: 0),
                                                    ),
                                                  );
                                                }
                                              });
                                            },
                                            buttonColor: themegreen,
                                            padding: EdgeInsets.symmetric(
                                                vertical: (6), horizontal: 13),
                                            buttonText: 'LOG IN',
                                          )
                                        ],
                                      )
                              ]),
                        ),
                      ),
                    ]),
        ),
      ),
    );
  }
}

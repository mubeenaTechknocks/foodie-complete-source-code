import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/enterExitAniation.dart';
import 'package:foodieadmin/goldPages/admin.dart';
import 'package:foodieadmin/goldWidgets/adminText.dart';
import 'package:foodieadmin/goldWidgets/btForgetPassword.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/passwordBox.dart';
import 'package:foodieadmin/goldWidgets/textBox.dart';
import 'package:foodieadmin/services/loginService.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email, password, token;
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
                                TextBox(
                                  width: wd / 2,
                                  margin: EdgeInsets.symmetric(vertical: 25),
                                  hintText: 'Email',
                                  autoCorrect: false,
                                ),
                                PasswordBox(
                                  width: wd / 2,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ColorButton(
                                      buttonAction: () {
                                        //Check the login credentials and give permission to  home page !!!!!!
                                        Navigator.push(
                                            context,
                                            EnterExitRoute(
                                                exitPage: Login(),
                                                enterPage: Admin()));
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
                                TextBox(
                                  margin: EdgeInsets.symmetric(vertical: 25),
                                  hintText: 'Email',
                                  autoCorrect: false,
                                  onChanged: (val) {
                                    email = val;
                                  },
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
                                                  login(email, password)
                                                      .then((value) {
                                                    if (value == false) {
                                                      print('Login Failed');
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
                                                  //Check the login credentials and give permission to  home page !!!!!!
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
                                                  login(email, password)
                                                  .then((value) {
                                                if (value == false) {
                                                  print('Login Failed');
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
                                              //Check the login credentials and give permission to  home page !!!!!!
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

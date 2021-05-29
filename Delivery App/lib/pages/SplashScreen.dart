import 'package:flutter/material.dart';
import 'package:foodie_delivery/pages/home.dart';
import 'package:foodie_delivery/pages/login.dart';
import 'package:foodie_delivery/services/login.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        getLoginStatus().then((value) {
          if (value) {
            _navigateToHome();
          } else
            _navigateToLogin();
        });
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});

    return true;
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
        builder: (BuildContext context) => Home(
              activeOrder: false,
            )));
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.asset(
              'images/splashScreen.png',
              width: width,
              height: height,
            ),
            Image.asset(
              'images/rider.gif',
              width: width,
            ),
          ])),
    );
  }
}

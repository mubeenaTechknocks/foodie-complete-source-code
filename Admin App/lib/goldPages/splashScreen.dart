import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/admin.dart';
import 'package:foodieadmin/goldPages/login.dart';
import 'package:foodieadmin/services/loginService.dart';

class Foodie extends StatefulWidget {
  @override
  _FoodieState createState() => _FoodieState();
}

class _FoodieState extends State<Foodie> {
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
    await Future.delayed(Duration(milliseconds: 2200), () {});

    return true;
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Admin()));
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'images/logo-with-caption.png',
        width: 200,
        height: 200,
      ),
    );
  }
}

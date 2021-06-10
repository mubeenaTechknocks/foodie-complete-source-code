import 'package:flutter/material.dart';
import 'package:foodieshop/forgotPassword/ui/requestOTPpage.dart';

class CustomTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequestOTPScreen(),
          ),
        );
      },
      child: Text(
        'Forget Password ?',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      splashColor: Colors.transparent,
    );
  }
}

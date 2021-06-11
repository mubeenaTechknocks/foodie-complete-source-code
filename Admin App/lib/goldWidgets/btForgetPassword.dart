import 'package:flutter/material.dart';
import 'package:foodieadmin/forgotPassword/ui/requestOTPpage.dart';

class CustomTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
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

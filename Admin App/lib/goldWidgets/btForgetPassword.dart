import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        print('show to password reset screen');
      },
      child: Text(
        'Forget Password ?',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      splashColor: Colors.transparent,
    );
  }
}

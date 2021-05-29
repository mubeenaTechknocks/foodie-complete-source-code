import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;

  const GreenButton({Key key, this.onPressed, this.buttonText = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        minWidth: 200,
        height: 50,
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

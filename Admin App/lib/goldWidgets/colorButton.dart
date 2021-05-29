import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final void Function() buttonAction;
  final String buttonText;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;

  const ColorButton(
      {Key key,
      this.buttonAction,
      this.buttonText,
      this.buttonColor,
      this.padding, Null Function() onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed:buttonAction,
      child: Container(
        padding: padding,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ),
        color: buttonColor
      ),
    );
  }
}

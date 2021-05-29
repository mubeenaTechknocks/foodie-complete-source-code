import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {
   final void Function() buttonAction;
  final String buttonText;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;

  const ColorButton(
      {Key key,
      this.buttonAction,
      this.buttonText,
      this.buttonColor,
      this.padding})
      : super(key: key);
  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.buttonAction,
      child: Container(
        padding: widget.padding,
        child: Text(
          widget.buttonText,
          style: TextStyle(color: Colors.white),
        ),
        color: widget.buttonColor
      ),
    );
  }
}

// class ColorButton extends StatelessWidget {
//   final void Function() buttonAction;
//   final String buttonText;
//   final Color buttonColor;
//   final EdgeInsetsGeometry padding;

//   const ColorButton(
//       {Key key,
//       this.buttonAction,
//       this.buttonText,
//       this.buttonColor,
//       this.padding})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       onPressed:buttonAction,
//       child: Container(
//         padding: padding,
//         child: Text(
//           buttonText,
//           style: TextStyle(color: Colors.white),
//         ),
//         color: buttonColor
//       ),
//     );
//   }
// }

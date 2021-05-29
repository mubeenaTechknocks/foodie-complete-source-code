import 'package:flutter/material.dart';

class PasswordBox extends StatefulWidget {
  final double width;
  final Function(String) onChanged;

  const PasswordBox({Key key, this.width = double.maxFinite, this.onChanged})
      : super(key: key);

  @override
  _PasswordBoxState createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  // var password, token;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(bottom: 25, top: 10),
      alignment: Alignment.center,
      width: widget.width,
      height: 50,
      color: Color.fromRGBO(16, 16, 16, 8),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey[700]),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

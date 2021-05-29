import 'package:flutter/material.dart';

class AdminText extends StatefulWidget {
  final double width;

  const AdminText({Key key, this.width = double.maxFinite}) : super(key: key);
  @override
  _AdminTextState createState() => _AdminTextState();
}

class _AdminTextState extends State<AdminText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(children: [
        Text(
          'Admin Account',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(48, 187, 0, 30),
          ),
        ),
      ]),
    );
  }
}

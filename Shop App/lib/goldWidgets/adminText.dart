import 'package:flutter/material.dart';

class AdminText extends StatelessWidget {
  final double width;

  const AdminText({Key key, this.width = double.maxFinite}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(children: [
        Text(
          'Shop Account',
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

import 'dart:ui';

import 'package:flutter/material.dart';

final themecolor = Colors.white;
final themeblack = Colors.black;
final themedimwhite = Colors.white38;
final themegreen = Color.fromRGBO(37, 142, 0, 1);
final themedimbalck = Color.fromRGBO(15, 15, 15, 10);
final themegreenlight = Colors.greenAccent[700];

TextStyle commonTextStyle = TextStyle(color: Colors.white, fontSize: 18);
String logo = 'images/logo.png';
String tick = 'images/tickimg.png';
String tickgif = 'images/tickgif.gif';
String profile = 'images/propic.jpeg';
Widget line = Divider(
  thickness: 7, color: themegreen,
// endIndent: 0,indent: 0,
);

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  final String title;
  TitleText({this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';

class FoodieTitle extends StatefulWidget {
  final String title;

  const FoodieTitle({Key key, this.title = ''}) : super(key: key);

  @override
  _FoodieTitleState createState() => _FoodieTitleState();
}

class _FoodieTitleState extends State<FoodieTitle> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 20, left: 35),
      //  color: Colors.red,
      height: 50,
      width: width,
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: themewhite,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/login.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/services/loginService.dart';

class FoodieAppbar extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget bottom;
  final double preferredHeight;

  final String title;
  FoodieAppbar({Key key, this.title, this.bottom, this.preferredHeight = 60.0})
      : preferredSize = Size.fromHeight(preferredHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _FoodieAppbarState createState() => _FoodieAppbarState();
}

class _FoodieAppbarState extends State<FoodieAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: widget.bottom,
      elevation: 0,
      shadowColor: themecolor,
      backgroundColor: themecolor,
      title: Image.asset(
        'images/logo.png',
        width: 100,
        height: 100,
      ),
      actions: [
        Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "SPOON",
              style: TextStyle(fontSize: 18),
            )),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: PopupMenuButton<String>(
            icon: Image.asset(
              'images/arrowdown.png',
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: Text("Log Out"),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'logout':
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);
                  removeToken();
                  break;
              }
            },
          ),
        ),
      ],
    );
  }
}

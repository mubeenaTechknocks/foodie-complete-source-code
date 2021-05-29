import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/sizeAnimation.dart';
import 'package:foodieadmin/goldPages/login.dart';
import 'package:foodieadmin/goldPages/setting.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/services/loginService.dart';

class FoodieAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final Widget leading;
  FoodieAppbar(
      {Key key,
      this.title,
      this.automaticallyImplyLeading = true,
      this.leading})
      : preferredSize = Size.fromHeight(60.0),
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
                "Admin Account",
                style: TextStyle(fontSize: 18),
              )),
          PopupMenuButton<String>(
            icon: Image.asset(
              'images/arrowdown.png',
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'settings',
                child: Text("Settings"),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text("Log Out"),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'settings':
                  Navigator.push(context, SizeRoute(page: Settings()));

                  break;
                case 'logout':
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);
                      removeToken();
                  break;
              }
            },
          ),
        ]);
  }
}

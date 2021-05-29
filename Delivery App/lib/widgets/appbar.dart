import 'package:flutter/material.dart';
import 'package:foodie_delivery/animations/enterExitAniation.dart';
import 'package:foodie_delivery/pages/home.dart';
import 'package:foodie_delivery/pages/login.dart';
import 'package:foodie_delivery/pages/settings/accountSettings.dart';
import 'package:foodie_delivery/services/login.dart';
import 'package:foodie_delivery/setting.dart';

class FoodieAppbar extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget bottom;
  final double preferredHeight;
  final bool isSettings;
  final bool isHome;
  final String title;
  FoodieAppbar(
      {Key key,
      this.title,
      this.bottom,
      this.preferredHeight = 60.0,
      this.isSettings = false,
      this.isHome = false})
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
      leading: widget.isHome == false
          ? BackButton(
              color: Colors.black,
            )
          : null,
      bottom: widget.bottom,
      elevation: 0,
      shadowColor: themecolor,
      backgroundColor: themecolor,
      title: Image.asset(
        logo,
        width: 100,
        height: 100,
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(top: 5),
          child: PopupMenuButton<String>(
            // icon: Image.asset('images/arrowdown.png',),
            icon: Icon(
              Icons.expand_more,
              color: themeblack,
            ),
            itemBuilder: (context) => [
              widget.isSettings
                  ? null
                  : PopupMenuItem(
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
                  Navigator.push(
                      context,
                      EnterExitRoute(
                        exitPage: Home(),
                        enterPage: Account(),
                      ));
                  break;
                case 'logout':
                  removeToken();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);

                  break;
              }
            },
          ),
        ),
      ],
    );
  }
}

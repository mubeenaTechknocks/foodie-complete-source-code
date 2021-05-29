import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';

class AttachmentButton extends StatelessWidget {
  final String title;

  const AttachmentButton({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
        color: themegreen,
        onPressed: () {},
        child: Text(
          "$title",
          style: TextStyle(color: Colors.white),
        ));
  }
}

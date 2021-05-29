import 'package:flutter/material.dart';
import 'package:foodie_delivery/pages/login.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';

class AccountManagement extends StatefulWidget {
  @override
  _AccountManagementState createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppbar(
        isSettings: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Change Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            PasswordBox(
              hintText: 'Current Password',
            ),
            PasswordBox(
              hintText: 'New Password',
            ),
            PasswordBox(
              hintText: 'Confirm Password',
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 50,
              minWidth: double.maxFinite,
              highlightColor: Colors.green,
              color: Colors.green[400],
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                "Change Password",
                style: TextStyle(color: themecolor, fontSize: 18),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class PasswordBox extends StatefulWidget {
  final String hintText;

  const PasswordBox({Key key, this.hintText}) : super(key: key);
  @override
  _PasswordBoxState createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      color: Colors.grey[300],
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: widget.hintText),
      ),
    );
  }
}

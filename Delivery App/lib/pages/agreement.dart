import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/pages/login.dart';
import 'package:foodie_delivery/services/register.dart';
import 'package:foodie_delivery/setting.dart';

class Agreement extends StatefulWidget {
  final UserModel user;

  const Agreement({Key key, this.user}) : super(key: key);
  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool agree = false;
  bool success = true;
  bool clicked = false;
  void donothing() {
    setState(() {
      clicked = true;
    });
    register(widget.user).then((value) {
      if (value == true) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return Login();
        }), (route) => false);
      } else {
        setState(() {
          clicked = false;
          success = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "images/agreement.gif",
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .65,
          child: Text(
            "Our recruitment team will contact you to verify your details",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.blue),
        ),
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Checkbox(
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value;
                });
              }),
          Text(
            "I have read and accept terms and conditions",
            style: TextStyle(color: Colors.black54),
          ),
        ]),
        clicked
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: agree ? donothing : null,
                child: Text('Agree and Request')),
        Divider(
          color: themecolor,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .65,
          child: success
              ? Text(
                  "You have to wait until your request accepted by the admin. It is good to go and come after confirmation",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                )
              : Text(
                  'Some Error occured while sending your request, Try again !!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
        ),
      ]),
    );
  }
}

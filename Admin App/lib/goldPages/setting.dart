import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/enterExitAniation.dart';
import 'package:foodieadmin/goldPages/accounts.dart';
import 'package:foodieadmin/goldPages/deliveryBoys.dart';
import 'package:foodieadmin/goldPages/subAdmin.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/orderCard.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: SingleChildScrollView(
          child: Column(children: [
            OrderCard(
              hotelName: 'SubAdmin',
              orderAmount: '',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SubAdmin()));
              },
            ),
            OrderCard(
              hotelName: 'Delivery Boys',
              orderAmount: '',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (contex) {
                  return DeliveryBoys();
                }));
              },
            ),
            OrderCard(
              hotelName: 'Accounts',
              orderAmount: '',
              onPressed: () {
                Navigator.push(
                    context,
                    EnterExitRoute(
                        exitPage: Settings(), enterPage: AdminAccounts()));
              },
            ),
          ]),
        ));
  }
}

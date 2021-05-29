import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/adminContent.dart';
import 'package:foodieshop/goldPages/shopAdd.dart';
import 'package:foodieshop/goldWidgets/appbar.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      appBar: FoodieAppbar(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: themegreen,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ShopAdd();
              }),
            );
          }),
      body: Admincontents(),
     
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieshop/goldPages/orders.dart';
import 'package:foodieshop/goldWidgets/adminCard.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/models/ordersModel.dart';

class Admincontents extends StatefulWidget {
  final List<OrdersModel> orders;

  const Admincontents({Key key, this.orders})
      : super(key: key);
  @override
  _AdmincontentsState createState() => _AdmincontentsState();
}

class _AdmincontentsState extends State<Admincontents> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        width: width,
        child: Column(
          children: [
           Card(
                    color: themegreen,
                    child: Column(children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Orders(
                                placedOrders: widget.orders,
                              );
                            }),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          width: width,
                          child: Text(
                            " View Your Orders >>> ",
                            style: TextStyle(
                                color: themewhite,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ),
              
            AdminCard(),
          ],
        ),
      ),
    );
  }
}

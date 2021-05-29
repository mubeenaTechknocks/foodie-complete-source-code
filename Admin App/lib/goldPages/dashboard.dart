import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/enterExitAniation.dart';
import 'package:foodieadmin/goldPages/graph.dart';
import 'package:foodieadmin/goldPages/orders.dart';
import 'package:foodieadmin/goldPages/restaurants.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/orderCard.dart';
import 'package:foodieadmin/goldWidgets/title.dart';
import 'package:foodieadmin/model/ordersModel.dart';
import 'package:foodieadmin/services/orderServices.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themecolor,
      appBar: FoodieAppbar(),
      body: FutureBuilder(
          future: getOrders(),
          builder: (context, AsyncSnapshot<List<OrdersModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(themegreen),
                ));
                break;
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Some error occured while loading data'),
                  );
                } else {
                  final delivered = snapshot.data
                      .where(
                          (s) => s.statusdetails.toLowerCase() == 'delivered')
                      .toList();
                  final placed = snapshot.data
                      .where((s) => s.statusdetails.toLowerCase() == 'placed')
                      .toList();
                  final prepairing = snapshot.data
                      .where(
                          (s) => s.statusdetails.toLowerCase() == 'prepairing')
                      .toList();
                  final tobepicked = snapshot.data
                      .where(
                          (s) => s.statusdetails.toLowerCase() == 'tobepicked')
                      .toList();
                  final accepetedbyDB = snapshot.data
                      .where((s) => s.statusdetails == 'accepetedbyDB')
                      .toList();

                  final picked = snapshot.data
                      .where((s) => s.statusdetails.toLowerCase() == 'picked')
                      .toList();
                  final pendingOrders =
                      placed + prepairing + tobepicked + accepetedbyDB + picked;
                  return SingleChildScrollView(
                    child: Column(children: [
                      FoodieTitle(title: 'Dashboard'),
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 300,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(50),
                            topRight: const Radius.circular(50),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                            top: 40,
                            left: 30,
                            child: Text(
                              "Delivered Orders",
                              style: TextStyle(
                                fontSize: 24,
                                color: themewhite,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80,
                            left: 30,
                            child: Text(
                              delivered.length.toString(),
                              style: TextStyle(
                                fontSize: 150,
                                fontWeight: FontWeight.bold,
                                color: themewhite,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 27),
                        child: OrderCard(
                          onPressed: () {
                      
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: Dashboard(),
                                    enterPage: Orders()));
                          },
                          hotelName: "Pending Orders",
                          orderAmount: pendingOrders.length.toString(),
                          redorgreen: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 27),
                        child: OrderCard(
                          onPressed: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: Dashboard(),
                                    enterPage: Restaurants()));
                          },
                          hotelName: "Restaurants",
                          orderAmount: "",
                          redorgreen: themegreen,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 7,
                        color: themegreen,
                        endIndent: 30,
                        indent: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 27),
                        child: OrderCard(
                          hotelName: "Graphic Report",
                          orderAmount: ">",
                          redorgreen: themegreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: Dashboard(),
                                    enterPage: GraphReport()));
                          },
                        ),
                      ),
                    ]),
                  );
                }
            }
          }),
    );
  }
}

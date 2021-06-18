import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/orderDetails.dart';
import 'package:foodieshop/goldPages/picked.dart';
import 'package:foodieshop/goldPages/prepairing.dart';
import 'package:foodieshop/goldPages/tobePicked.dart';
import 'package:foodieshop/goldWidgets/appbar.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/goldWidgets/orderCard.dart';
import 'package:foodieshop/models/ordersModel.dart';
import 'package:foodieshop/services/orderServices.dart';

class Orders extends StatefulWidget {
  final List<OrdersModel> placedOrders;

  const Orders({Key key, this.placedOrders}) : super(key: key);
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: FutureBuilder(
            future: getOrders(),
            builder: (context, AsyncSnapshot<List<OrdersModel>> snapShot) {
              switch (snapShot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(themegreen),
                  ));
                  break;
                default:
                  if (snapShot.hasError)
                    return Center(child: Text('Some Error Occured'));
                  final placed = snapShot.data
                      .where((s) => s.statusdetails.toLowerCase() == 'placed')
                      .toList();
                  final prepairing = snapShot.data
                      .where(
                          (s) => s.statusdetails.toLowerCase() == 'prepairing')
                      .toList();
                  final tobepicked1 = snapShot.data
                      .where(
                          (s) => s.statusdetails.toLowerCase() == 'tobepicked')
                      .toList();
                  final tobepicked2 = snapShot.data
                      .where((s) => s.statusdetails == 'accepetedbyDB')
                      .toList();
                  final tobepicked = tobepicked1 + tobepicked2;
                  final picked = snapShot.data
                      .where((s) => s.statusdetails.toLowerCase() == 'picked')
                      .toList();
                  return Column(
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: themecolor,
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: TabBar(
                          isScrollable: true,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              50.0,
                            ),
                            color: themegreen,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            Tab(
                              child: Text(
                                'Placed (${placed.length})',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Prepairing (${prepairing.length})',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'To Be Picked (${tobepicked.length})',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Picked (${picked.length})',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            //
                            //Placed Orders
                            //
                            placed.length == 0
                                ? Center(
                                    child: Text(
                                    'No new orders',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                                : ListView.builder(
                                    itemCount: placed.length,
                                    itemBuilder: (context, index) {
                                      OrdersModel placedOrder = placed[index];
                                      return OrderCard(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return OrderDetails(
                                              placedOrder: placedOrder,
                                            );
                                          })).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        itemname: placedOrder.itemName,
                                        time: '',
                                      );
                                    }),
                            //
                            //Prepairing Orders
                            //
                            prepairing.length == 0
                                ? Center(
                                    child: Text(
                                    'No prepairing orders',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                                : ListView.builder(
                                    itemCount: prepairing.length,
                                    itemBuilder: (context, index) {
                                      OrdersModel prepairingOrder =
                                          prepairing[index];
                                      return OrderCard(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return Preparing(
                                                order: prepairingOrder,
                                              );
                                            }),
                                          ).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        itemname: prepairingOrder.itemName,
                                        time: '',
                                      );
                                    }),
                            //
                            //To be picked Orders
                            //
                            tobepicked.length == 0
                                ? Center(
                                    child: Text(
                                    'No Order is ready for delivery',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                                : ListView.builder(
                                    itemCount: tobepicked.length,
                                    itemBuilder: (context, index) {
                                      OrdersModel tobepickedOrder =
                                          tobepicked[index];
                                      return OrderCard(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return TobePicked(
                                                order: tobepickedOrder,
                                              );
                                            }),
                                          ).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        itemname: tobepickedOrder.itemName,
                                      );
                                    }),
                            //
                            // picked Orders
                            //
                            picked.length == 0
                                ? Center(
                                    child: Text(
                                    'No Order is out for delivery',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                                : ListView.builder(
                                    itemCount: picked.length,
                                    itemBuilder: (context, index) {
                                      OrdersModel pickedOrder = picked[index];
                                      return OrderCard(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return Picked(
                                                order: pickedOrder,
                                              );
                                            }),
                                          ).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        itemname: pickedOrder.itemName,
                                      );
                                    }),
                          ],
                        ),
                      ),
                    ],
                  );
              }
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/enterExitAniation.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'dart:math' as math;
import 'package:foodieadmin/goldWidgets/orderCard.dart';
import 'package:foodieadmin/model/ordersModel.dart';
import 'package:foodieadmin/services/orderServices.dart';

import 'orderDetails.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatefulWidget {
  final String hotelName;

  const CollapsingList({Key key, this.hotelName}) : super(key: key);

  @override
  _CollapsingListState createState() => _CollapsingListState();
}

class _CollapsingListState extends State<CollapsingList> {
  SliverPersistentHeader makeHeader(String headerText, Color headerColor) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 100.0,
        child: Container(
          color: headerColor,
          child: Center(
            child: Text(
              headerText,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getOrders(),
        builder: (context, AsyncSnapshot<List<OrdersModel>> snapshot) {
          if (snapshot.hasData) {
            final orders = snapshot.data
                .where((s) => s.hotelname == widget.hotelName)
                .toList();
            final delivered = orders
                .where((s) => s.statusdetails.toLowerCase() == 'delivered')
                .toList();
            final placed = orders
                .where((s) => s.statusdetails.toLowerCase() == 'placed')
                .toList();
            final prepairing = orders
                .where((s) => s.statusdetails.toLowerCase() == 'prepairing')
                .toList();
            final tobepicked = orders
                .where((s) => s.statusdetails.toLowerCase() == 'tobepicked')
                .toList();
            final accepetedbyDB = orders
                .where((s) => s.statusdetails == 'accepetedbyDB')
                .toList();

            final picked = orders
                .where((s) => s.statusdetails.toLowerCase() == 'picked')
                .toList();
            final pendingOrders =
                placed + prepairing + tobepicked + accepetedbyDB + picked;
            return pendingOrders.length == 0 && delivered.length == 0
                ? Center(
                    child: Text(
                      'No Orders for ${widget.hotelName}',
                      style: TextStyle(
                          color: themegreen,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : CustomScrollView(
                    slivers: <Widget>[
                      makeHeader(widget.hotelName ?? 'hotelName', Colors.black),
                      makeHeader('Pending Orders', Colors.red),
                      SliverFixedExtentList(
                        itemExtent: 70,
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          if (pendingOrders.length == 0) {
                            return SizedBox();
                          } else {
                            if (index >= pendingOrders.length) return null;
                            OrdersModel order = pendingOrders[index];
                            return OrderCard(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    EnterExitRoute(
                                        exitPage: CollapsingList(),
                                        enterPage: OrderDetails(order: order)));
                              },
                              hotelName: order.itemName,
                              orderAmount: order.quantity,
                              redorgreen: Colors.red,
                            );
                          }
                        }),
                      ),
                      makeHeader('Delivered Orders', themegreen),
                      SliverFixedExtentList(
                        itemExtent: 80,
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          if (delivered.length == 0) {
                            return SizedBox();
                          } else {
                            if (index >= delivered.length) return null;
                            OrdersModel order = delivered[index];
                            return OrderCard(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    EnterExitRoute(
                                        exitPage: CollapsingList(),
                                        enterPage: OrderDetails(order: order)));
                              },
                              hotelName: order.itemName,
                              orderAmount: order.quantity,
                              redorgreen: themegreen,
                            );
                          }
                        }),
                      ),
                    ],
                  );
          } else if (snapshot.hasError) {
            return Text('Some error occured',
                style: TextStyle(color: Colors.white));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

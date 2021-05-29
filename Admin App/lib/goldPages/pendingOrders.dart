import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/enterExitAniation.dart';
import 'package:foodieadmin/goldPages/orderDetails.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/orderCard.dart';
import 'package:foodieadmin/model/ordersModel.dart';
import 'package:foodieadmin/services/orderServices.dart';

class PendingOrders extends StatefulWidget {
  final String hotelname;

  const PendingOrders({Key key, this.hotelname}) : super(key: key);

  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Pending Orders',
                      style: commonTextStyle,
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: getOrders(),
                    builder:
                        (context, AsyncSnapshot<List<OrdersModel>> snapshot) {
                      if (snapshot.hasData) {
                        final placed = snapshot.data
                            .where((s) =>
                                s.statusdetails.toLowerCase() == 'placed')
                            .toList();
                        final prepairing = snapshot.data
                            .where((s) =>
                                s.statusdetails.toLowerCase() == 'prepairing')
                            .toList();
                        final tobepicked = snapshot.data
                            .where((s) =>
                                s.statusdetails.toLowerCase() == 'tobepicked')
                            .toList();
                        final accepetedbyDB = snapshot.data
                            .where((s) => s.statusdetails == 'accepetedbyDB')
                            .toList();

                        final picked = snapshot.data
                            .where((s) =>
                                s.statusdetails.toLowerCase() == 'picked')
                            .toList();
                        final pendingOrders = placed +
                            prepairing +
                            tobepicked +
                            accepetedbyDB +
                            picked;

                        final ordersForBuild = pendingOrders
                            .where((s) => s.hotelname == widget.hotelname)
                            .toList();
                        return ordersForBuild.length == 0
                            ? Center(
                                child: Text(
                                  'No pending orders for ${widget.hotelname}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: themegreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : ListView.builder(
                                itemCount: ordersForBuild.length,
                                itemBuilder: (BuildContext context, int index) {
                            OrdersModel pendingorders =
                                      ordersForBuild[index];
                                  return OrderCard(
                              hotelName: pendingorders.itemName ?? "",
                                    orderAmount: pendingorders.quantity ?? "",
                                    redorgreen: Colors.red,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          EnterExitRoute(
                                              exitPage: PendingOrders(),
                                        enterPage: OrderDetails(
                                                  order: pendingorders)));
                                    },
                            );
                                },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Loading Failed'));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}

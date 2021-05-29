import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/services/getLocation.dart';
import 'package:foodie_delivery/services/orderServices.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';
import 'package:foodie_delivery/widgets/home/greenSection.dart';
import 'package:foodie_delivery/widgets/swipeList.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  final bool activeOrder;
  final OrdersModel order;

  const Home({Key key, this.activeOrder = false, this.order}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Location location = Location();
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    location.changeSettings(interval: 10000);
    // print(widget.order.username);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: themecolor,
      appBar: FoodieAppbar(
        isHome: true,
      ),
      body: StreamBuilder(
          stream: location.onLocationChanged,
          builder: (context, snap) {
            if (snap.hasData) {
              return FutureBuilder(
                future: getOrders(),
                builder: (context, AsyncSnapshot<List<OrdersModel>> snapShot) {
                  if (snapShot.hasData) {
                    final orders = snapShot.data
                        .where((s) =>
                            s.statusdetails.toLowerCase() == 'tobepicked')
                        .toList();
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      width: width,
                      //Base container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.activeOrder
                              ? GreenSection(
                                  order: widget.order,
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text(
                              'Incoming Orders',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          orders.length == 0
                              ? SizedBox(
                                  height: 200,
                                  child: Center(
                                      child: Text(
                                    'NO NEW ORDERS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                )
                              :
                            SwipeList(
                              locationdata: snap.data,
                              orders: orders,
                            ),
                        ],
                      ),
                    );
                  } else if (snapShot.hasError) {
                    return Center(
                      child: Text('Loading Failed '),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            } else if (snap.hasError) {
              return Text('Enable Location Access');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

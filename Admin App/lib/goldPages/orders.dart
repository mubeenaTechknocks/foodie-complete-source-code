import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/enterExitAniation.dart';
import 'package:foodieadmin/goldPages/pendingOrders.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/searchbar.dart';
import 'package:foodieadmin/goldWidgets/orderCard.dart';
import 'package:foodieadmin/model/shopdetails.dart';
import 'package:foodieadmin/services/getshopdetails.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Hotels',
                style: commonTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
              ),
            ),
            SizedBox(
                height: height * .75,
                child: FutureBuilder(
                  future: gethotels(),
                  builder: (context, AsyncSnapshot<List<Shop>> snapShot) {
                    if (snapShot.hasData) {
                      final sorted = query == ''
                          ? snapShot.data
                          : snapShot.data
                              .where((element) => element.hotelsname
                                  .toLowerCase()
                                  .contains(query))
                              .toList();
                      return sorted.length == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'No matches for your search',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: themegreen,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.builder(
                              itemCount: sorted.length,
                              itemBuilder: (BuildContext context, int index) {
                          Shop shop = sorted[index];
                                return OrderCard(
                            onPressed: () {
                                    Navigator.push(
                                        context,
                                        EnterExitRoute(
                                            exitPage: Orders(),
                                      enterPage: PendingOrders(
                                                hotelname: shop.hotelsname)));
                                  },
                            hotelName: shop.hotelsname,
                                  orderAmount: '',
                                  redorgreen: Colors.red,
                                );
                              },
                      );
                    } else if (snapShot.hasError) {
                      return Center(child: Text('Loading Failed'));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ));
  }
}

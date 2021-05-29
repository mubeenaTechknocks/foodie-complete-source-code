import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/DeliveryBoysRequests.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/commoncard.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/searchBar%20copy.dart';

import 'package:foodieadmin/model/deliveryboys.dart';
import 'package:foodieadmin/services/getdeliveryboys.dart';

class DeliveryBoys extends StatefulWidget {
  @override
  _DeliveryBoysState createState() => _DeliveryBoysState();
}

class _DeliveryBoysState extends State<DeliveryBoys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.notification_important,
          ),
          backgroundColor: themegreen,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DeliverboysRequest();
              }),
            );
          },
        ),
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'DELIVERY BOYS',
                style: commonTextStyle,
              ),
              Searchbar(),
              SizedBox(
                height: 1,
              ),
              Expanded(
                child: FutureBuilder(
              future: getdata(),
                          builder:(context,snapShot){
                            if(snapShot.hasData){
                            return ListView.builder(
                  itemCount: snapShot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Deliveryboys deliveryboys = snapShot.data[index];
                    return CommonCard(
                      hotelname: deliveryboys.name??"",
                      location: deliveryboys.city??"",
                      mobile: deliveryboys.phone??"",
                    );
                  },
                );}else if(snapShot.hasError){
               return Center(child:Text('Loading Failed'));
              } else {
                return Center(child: CircularProgressIndicator(),);
              }},
              )
            ),
                ],
        )))));
  }
}
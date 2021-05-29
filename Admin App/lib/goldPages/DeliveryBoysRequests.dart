import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/deliverboyDetailForAccept.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/orderCard.dart';

import 'package:foodieadmin/model/deliveryboys.dart';
import 'package:foodieadmin/services/getdeliveryboys.dart';

class DeliverboysRequest extends StatefulWidget {
  @override
  _DeliverboysRequestState createState() => _DeliverboysRequestState();
}

class _DeliverboysRequestState extends State<DeliverboysRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: FutureBuilder(
              future: getdata(),
              
                          builder:(context,snapShot){
                            if(snapShot.hasData){
                            return ListView.builder(
            itemCount: snapShot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Deliveryboys deliveryboys = snapShot.data[index];
              print(snapShot.data);
              return OrderCard(
                deliveryboys: deliveryboys,
                hotelName: deliveryboys.name??"",
                orderAmount: '',
                redorgreen: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DeliveryBoyDetailsForAccept(deliveryboys: deliveryboys)));
                },
              );
              });} else if(snapShot.hasError){
                      return Center(child:Text('Loading Failed'));
                     } else {
                return Center(child: CircularProgressIndicator(),);
                    }}));
  }
}


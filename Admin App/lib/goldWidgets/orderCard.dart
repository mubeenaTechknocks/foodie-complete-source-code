import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/model/deliveryboys.dart';
import 'package:foodieadmin/model/deliveredorders.dart';
import 'package:foodieadmin/model/pendingorders.dart';
import 'package:foodieadmin/model/shopdetails.dart';

class OrderCard extends StatefulWidget {
  final String hotelName;
  final String orderAmount;
  final Color redorgreen;
  final Deliveryboys deliveryboys;
   final Pendingorders pendingorders;
   final Deliveredorders deliveredorders;
  final void Function() onPressed;
  const OrderCard(
      {Key key,
      this.hotelName = '', 
      this.orderAmount = '',
      this.redorgreen,
      this.onPressed, Shop shop,this.deliveryboys, this.pendingorders, this.deliveredorders})
      : super(key: key);
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: widget.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: themedimbalck,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.hotelName,
                  style: commonTextStyle,
                ),
                Text(
                  widget.orderAmount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: widget.redorgreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

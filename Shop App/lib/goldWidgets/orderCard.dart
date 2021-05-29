import 'package:flutter/material.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
class OrderCard extends StatefulWidget {
   final String itemname;
  final String time;
  final void Function() onPressed;

  const OrderCard({Key key, this.itemname='', this.time='', this.onPressed})
      : super(key: key);
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
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
                  widget.itemname,
                  style: commonTextStyle,
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
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

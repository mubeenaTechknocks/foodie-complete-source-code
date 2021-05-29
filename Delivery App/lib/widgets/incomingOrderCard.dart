import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:location/location.dart';

class IncomingOrderCard extends StatefulWidget {
  final OrdersModel order;
  final LocationData locationdata;
  final Function() onTap;

  const IncomingOrderCard({Key key, this.order, this.locationdata, this.onTap})
      : super(key: key);
  @override
  _IncomingOrderCardState createState() => _IncomingOrderCardState();
}

class _IncomingOrderCardState extends State<IncomingOrderCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
        ),
        // color: Colors.red,
        height: 85,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick From : ' + widget.order.hotelname ?? '',
                style: TextStyle(fontSize: 20),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Deliver To : ' + widget.order.street,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '3 km',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ])
            ]),
      ),
    );
  }
}

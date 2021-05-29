import 'package:flutter/material.dart';
import 'package:foodieshop/goldWidgets/appbar.dart';
import 'package:foodieshop/goldWidgets/colorButton.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/models/ordersModel.dart';
import 'package:foodieshop/services/orderServices.dart';

class OrderDetails extends StatefulWidget {
  final OrdersModel placedOrder;

  const OrderDetails({Key key, this.placedOrder}) : super(key: key);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themedimbalck,
            title: Text(
              'Discard Changes ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to decline this order ?',
                    style: commonTextStyle,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ColorButton(
                padding: wt > 600
                    ? EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                    : EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                buttonColor: themegreen,
                buttonText: ('No'),
                buttonAction: () {
                  Navigator.of(context).pop();
                },
              ),
              ColorButton(
                padding: wt > 600
                    ? EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                    : EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                buttonColor: Colors.red,
                buttonText: ('Yes'),
                buttonAction: () {
                  Navigator.pop(context);

                  updateOrderStatus(widget.placedOrder.id, "declined");

                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: themecolor,
      appBar: FoodieAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Order Details',
                    style: commonTextStyle,
                  ),
                ),
                OrderSummary(
                  order: widget.placedOrder,
                ),
                ItemCard(order: widget.placedOrder),
                BillCard(
                  order: widget.placedOrder,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ColorButton(
                          buttonAction: () {
                            _showMyDialog();
                          },
                          buttonColor: Colors.red,
                          buttonText: 'DECLINE',
                          padding: wt > 600
                              ? EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ColorButton(
                          buttonAction: () {
                            updateOrderStatus(
                                    widget.placedOrder.id, "prepairing")
                                .then((value) => Navigator.pop(context));
                          },
                          buttonColor: themegreen,
                          buttonText: 'ACCEPT',
                          padding: wt > 600
                              ? EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderSummary extends StatefulWidget {
  final OrdersModel order;

  const OrderSummary({Key key, this.order}) : super(key: key);
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    // String date = DateFormat.yMd(widget.order.orderdate).toString();

    TextStyle cardTextleft = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );
    TextStyle cardTextRight = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 30, 20),
          height: 200,
          color: themedimbalck,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order Date', style: cardTextleft),
                  Text(widget.order.orderdate, style: cardTextRight),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment', style: cardTextleft),
                  Text(
                    widget.order.payment,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: themegreen,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address', style: cardTextleft),
                  Text(
                      widget.order.housename +
                          "\n" +
                          widget.order.street +
                          "\n" +
                          widget.order.city,
                      style: cardTextRight),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final OrdersModel order;

  const ItemCard({Key key, this.order}) : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextStyle cardTextRight = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    return Card(
      child: Container(
        height: width < 330 ? 75 : 100,
        width: width < 330 ? null : width * .78,
        color: themedimbalck,
        child: Row(
          children: [
            Container(
              width: width < 330 ? 70 : 100,
              height: width < 330 ? 70 : 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                image: DecorationImage(
                    image: AssetImage('images/Chicken65.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.order.itemName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Price :          ${widget.order.itemRate}/-',
                    style: cardTextRight,
                  ),
                  Text(
                    'Quantity :   ${widget.order.quantity}   x1',
                    style: cardTextRight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BillCard extends StatefulWidget {
  final OrdersModel order;

  const BillCard({Key key, this.order}) : super(key: key);
  @override
  _BillCardState createState() => _BillCardState();
}

class _BillCardState extends State<BillCard> {
  @override
  Widget build(BuildContext context) {
    double tax = (int.parse(widget.order.itemRate) * .18);
    double deliveryCharge = (int.parse(widget.order.itemRate) * .1);
    double total = int.parse(widget.order.itemRate) + deliveryCharge + tax;
    // Widget padding = Padding(padding: EdgeInsets.symmetric(vertical: 10));
    TextStyle bold = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    TextStyle normal = TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 30, 20),
          color: themedimbalck,
          width: double.maxFinite,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.order.username, style: bold),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(widget.order.phno, style: normal),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: SizedBox(
                height: 90,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Price',
                              style: normal,
                            ),
                            Text(
                              widget.order.itemRate,
                              style: bold,
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charge',
                              style: normal,
                            ),
                            Text(
                              deliveryCharge.toString(),
                              style: bold,
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax',
                              style: normal,
                            ),
                            Text(
                              tax.toString(),
                              style: bold,
                            ),
                          ]),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(
                thickness: 7,
                color: themegreen,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Total',
                style: normal,
              ),
              Text(
                total.toString(),
                style: bold,
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

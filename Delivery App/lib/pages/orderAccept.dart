import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/pages/home.dart';
import 'package:foodie_delivery/services/orderServices.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';
import 'package:foodie_delivery/widgets/greyLine.dart';
import 'package:foodie_delivery/widgets/orderDetails/adressSection.dart';

class OrderAccept extends StatefulWidget {
  final OrdersModel order;

  const OrderAccept({Key key, this.order}) : super(key: key);
  @override
  _OrderAcceptState createState() => _OrderAcceptState();
}

class _OrderAcceptState extends State<OrderAccept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppbar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FirstSection(
            order: widget.order,
          ),
          AdressSection(
            phone: widget.order.hotelphonenumber,
            latitude: double.parse(widget.order.hotellatitude),
            longitude: double.parse(widget.order.hotellongitude),
            adresstitle: 'Pickup Adress',
            address: widget.order.hotelname +
                '\n' +
                widget.order.hoteladdressplace +
                '\n' +
                widget.order.hoteladdresscity,
          ),
          AdressSection(
            latitude: double.parse(widget.order.userlatitude),
            longitude: double.parse(widget.order.userlongitude),
            phone: int.parse(widget.order.phno),
            adresstitle: 'Delivery Adress',
            address: widget.order.username +
                    '\n' +
                    widget.order.housename +
                    '\n' +
                    widget.order.street ??
                '' + '\n' + widget.order.street ??
                '' + '\n' + widget.order.city ??
                '',
          ),
        ]),
      ),
    );
  }
}

class FirstSection extends StatefulWidget {
  final OrdersModel order;

  const FirstSection({Key key, this.order}) : super(key: key);
  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    double earning = (int.parse(widget.order.itemRate) * .12);
    print(widget.order.username);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Order Details\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          'Your Earnings from this delivery',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          '₹ $earning\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themegreen,
            fontSize: 20,
          ),
        ),
        Text(
          'Travelling Distance',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          '3 KM\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themegreen,
            fontSize: 20,
          ),
        ),
        Container(
     
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            // border: Border.all(color: themegreen, width: 2),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // CustomButton(
            //   onTap: () {
            //     Navigator.pushAndRemoveUntil(context,
            //         MaterialPageRoute(builder: (context) {
            //       return Home();
            //     }), (route) => false);
            //   },
            //   color: Colors.red,
            //   text: 'DECLINE',
            //   border: BorderRadius.only(
            //     topLeft: Radius.circular(50),
            //     bottomLeft: Radius.circular(50),
            //   ),
            // ),
            clicked
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(themegreen),
                  )
                : CustomButton(
                    onTap: () {
                      setState(() {
                        clicked = true;
                      });
                      updateOrderStatus(widget.order.id, 'accepetedbyDB')
                          .then((value) {
                        if (value == true) {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return Home(
                              order: widget.order,
                              activeOrder: true,
                            );
                          }), (route) => false);
                        } else {
                          setState(() {
                            clicked = false;
                          });
                        }
                      });
                    },
                    color: themegreen,
                    text: 'ACCEPT',
                    border: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
          ]),
        ),
        GreyLine(),
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry border;
  final String text;
  final Color color;
  final Function() onTap;

  const CustomButton({Key key, this.border, this.text, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
      
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: border,
          ),
          alignment: Alignment.center,
          height: 50,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

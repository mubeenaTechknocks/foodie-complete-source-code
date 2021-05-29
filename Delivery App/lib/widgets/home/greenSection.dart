import 'package:flutter/material.dart';
import 'package:foodie_delivery/animations/enterExitAniation.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/pages/home.dart';
import 'package:foodie_delivery/pages/orderDetails.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/roundButton.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:maps_launcher/maps_launcher.dart';

class GreenSection extends StatefulWidget {
  final OrdersModel order;

  const GreenSection({Key key, this.order}) : super(key: key);
  @override
  _GreenSectionState createState() => _GreenSectionState();
}

class _GreenSectionState extends State<GreenSection> {
  @override
  Widget build(BuildContext context) {
    Widget padding = Padding(
      padding: EdgeInsets.only(bottom: 10),
    );
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            EnterExitRoute(
              exitPage: Home(),
              enterPage: OrderDetails(
                order: widget.order,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: themegreenlight,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        width: width * .9,
        //green container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Active Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            
            ]),
            padding,
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '3 km',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '  away'),
              ]),
            ),
            padding,
            Row(children: [
              RoundButton(
                icon: Icons.location_on,
                iconColor: Colors.red,
                onPressed: () {
                  MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
                },
              ),
              RoundButton(
                icon: Icons.call,
                iconColor: themegreen,
                onPressed: () {
                  UrlLauncher.launch("tel://" + widget.order.phno);
                },
              ),
              Text(
                widget.order.username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

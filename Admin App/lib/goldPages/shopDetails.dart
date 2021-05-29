import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/title.dart';
import 'package:foodieadmin/model/shopdetails.dart';

class ShopDetails extends StatefulWidget {
  final Shop shop;

  const ShopDetails({Key key, this.shop}) : super(key: key);
  @override
  _ShopDetailsState createState() => _ShopDetailsState();


}

class _ShopDetailsState extends State<ShopDetails> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            FoodieTitle(
              title: 'Shop Details',
            ),
            SizedBox(height: 30),
           FoodieList(
             data: widget.shop.hotelsname,
            ),
            FoodieAddress(
              address: widget.shop.hotelsaddress,
            ),
            FoodieList(
              data: widget.shop.pincode.toString(),
            ),
            line,
            FoodieTitle(title: 'Owner Detail'),
            SizedBox(height: 30),
            FoodieList(
              data: widget.shop.ownersname,
            ),
            FoodieAddress(
              address: widget.shop.ownersaddress,
            ),
            FoodieList(
              data: widget.shop.contactnumber.toString(),
            ),
            FoodieList(
              data: widget.shop.email,
            ),
            line,
          ]),
        ));
  }
}

class FoodieList extends StatelessWidget {
  final String data;
  final double height;

  const FoodieList({
    Key key,
    this.data,
    this.height: 50,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      //  color: Colors.red,
      height: height,
      width: width,
      padding: EdgeInsets.only(left: 40, top: 12),

      child: Text(
        "$data",
        style: TextStyle(fontSize: 23, color: themewhite),
      ),
    );
  }
}

class FoodieAddress extends StatefulWidget {
  final String address;
  final bool multiline;
  const FoodieAddress({
    Key key,
    this.address,
    this.multiline = false,
  }) : super(key: key);
  @override
  _FoodieAddressState createState() => _FoodieAddressState();
}

class _FoodieAddressState extends State<FoodieAddress> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.multiline ? null : 50,
      width: width * 0.82,
      padding: EdgeInsets.only(left: 0, top: 12),
      child: Text(
        widget.address,
        style: TextStyle(fontSize: 23, color: themewhite),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:foodieadmin/animations/sizeAnimation.dart';
import 'package:foodieadmin/goldPages/shopDetails.dart';
import 'package:foodieadmin/goldPages/shopEdit.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/model/shopdetails.dart';

class ShopCard extends StatefulWidget {
  final String hotelname;
  final String location;
  final String mobile;
  final Shop shop;

  const ShopCard({Key key, this.hotelname, this.location, this.mobile, this.shop})
      : super(key: key);

  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context1) {
            return ShopDetails(
              shop: widget.shop,
            );
          }),
        );
      },
      child: Card(
        color: themedimbalck,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 7, left: 7),
                // color: Colors.red,
                height: 73,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hotelname,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: themewhite,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      widget.location,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: themewhite,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.mobile,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: themewhite,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Image.asset(
                    'images/edit.png',
                    width: 27,
                    height: 27,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      SizeRoute(
                        page: ShopEdit(
                          shop: widget.shop,
                        )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // child: Stack(children: [
        //   Positioned(
        //       left: width * 0.040,
        //       top: height * 0.02,
        //       child: Text(widget.hotelname,
        //           style: TextStyle(
        //               color: themewhite,
        //               fontSize: 22,
        //               fontWeight: FontWeight.w800))),
        //   Positioned(
        //       left: width * 0.040,
        //       top: height * 0.06,
        //       child: Text(widget.location,
        //           style: TextStyle(
        //             color: themewhite,
        //             fontSize: 14,
        //           ))),
        //   Positioned(
        //       left: width * 0.040,
        //       top: height * 0.09,
        //       child: Text(widget.mobile,
        //           style: TextStyle(
        //             color: themewhite,
        //             fontSize: 14,
        //           ))),
        //   Positioned(
        //       left: width * 0.300,
        //       top: height * 0.15,
        //       child: IconButton(
        //         icon: Image.asset(
        //           'images/edit.png',
        //           width: 35,
        //           height: 35,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) {
        //               return ShopEdit();
        //             }),
        //           );
        //         },
        //         splashRadius: 1,
        //       )),
        // ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/goldWidgets/switch.dart';
import 'package:foodieshop/models/fooditems.dart';
import 'package:foodieshop/services/apiUrls.dart';

class ShopCard extends StatefulWidget {
  final FoodItems fooditem;
  final Function() onPressed;

  const ShopCard({
    Key key,
    this.onPressed,
    this.fooditem,
  }) : super(key: key);

  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Card(
        color: themedimbalck,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        child: Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  ApiUrls.baseUrl +
                                      '/' +
                                      widget.fooditem.productImage,
                                ),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.fooditem.productname.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: themewhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800)),
                            Text('Rs.${widget.fooditem.rate}/-',
                                style: TextStyle(
                                  color: themewhite,
                                  fontSize: 14,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: SwitchAvailability(
                  fooditem: widget.fooditem,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

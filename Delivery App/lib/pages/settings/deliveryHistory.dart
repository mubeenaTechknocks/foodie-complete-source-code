import 'package:flutter/material.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';
import 'package:foodie_delivery/widgets/greyLine.dart';

class DeliveryHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppbar(
        isSettings: true,
      ),
      body: SizedBox(
        child: Column(
          children: [
            //TODO: Add filter options
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ShortHistory();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShortHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Travel Distance',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '11KM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: themegreen,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Earned',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '23.07',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: themegreen,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GreyLine(),
        ],
      ),
    );
  }
}

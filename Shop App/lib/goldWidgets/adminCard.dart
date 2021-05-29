import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/product.dart';
import 'package:foodieshop/goldWidgets/card.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/models/fooditems.dart';
import 'package:foodieshop/services/productCRUD.dart';

class AdminCard extends StatefulWidget {
  @override
  _AdminCardState createState() => _AdminCardState();
}

class _AdminCardState extends State<AdminCard> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: width,
          height: 80,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                style: TextStyle(color: themewhite, fontSize: 18),
                showCursor: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: themewhite,
                    size: 35,
                  ),
                  hintText: "SEARCH FOR PRODUCTS",
                  hintStyle: TextStyle(color: themedimwhite, fontSize: 14),
                  focusColor: themewhite,
                ),
              ),
            ), //text inputbox container
            Divider(
              thickness: 7,
              color: themegreen,
              endIndent: 20,
              indent: 20,
            )
          ]),
        ),
        FutureBuilder(
            future: loadProducts(),
            builder: (context, AsyncSnapshot<List<FoodItems>> snapShot) {
              // Implements Searching in the given list
              final result = query == ''
                  ? snapShot.data
                  : snapShot.data
                      .where((s) => s.productname.toLowerCase().contains(query))
                      .toList();
              // print(result);

              switch (snapShot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  );
                  break;
                default:
                  if (snapShot.hasError)
                    return Center(child: Text('Some Error Occured'));
                  return result.length == 0
                      ? Text(
                          'Oops !!! \nNo Matches ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : SizedBox(
                          height: height * .7,
                          child: ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (BuildContext context, int index) {
                              FoodItems fooditem = result[index];

                              return ShopCard(
                                fooditem: fooditem,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return Product(
                                              fooditem: fooditem,
                                            );
                                          }),
                                        );
                                      },
                                     
                                    );
                                 
                            },
                          ),
                        );
              }
            }),
      ],
    );
  }
}

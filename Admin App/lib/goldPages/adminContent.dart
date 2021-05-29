import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/card.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/searchbar.dart';
import 'package:foodieadmin/model/shopdetails.dart';
import 'package:foodieadmin/services/getshopdetails.dart';

class Admincontents extends StatefulWidget {
  @override
  _AdmincontentsState createState() => _AdmincontentsState();
}

class _AdmincontentsState extends State<Admincontents> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .1),
              child: SearchBar(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
              ),
            ),
            Container(
              height: height * 0.73,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 28,
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: FutureBuilder(
                        future: gethotels(),
                        builder: (context, AsyncSnapshot<List<Shop>> snapShot) {
                          if (snapShot.hasData) {
                            final sorted = query == ''
                                ? snapShot.data
                                : snapShot.data
                                    .where((element) => element.hotelsname
                                        .toLowerCase()
                                        .contains(query))
                                    .toList();
                            return sorted.length == 0
                                ? Text(
                                    'No matches for your search',
                                    style: TextStyle(
                                        color: themegreen,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5),
                                    itemCount: sorted.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Shop shop = sorted[index];
                                      return ShopCard(
                                        shop: shop,
                                        location: shop.hotelslocation,
                                        mobile: shop.contactnumber.toString(),
                                        hotelname: shop.hotelsname,
                                      );
                                    },
                                  );
                          } else if (snapShot.hasError) {
                            return Center(child: Text('Loading Failed'));
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
              ),
            )
            // Container(
            //   width: width,
            //   height: 90,
            //   child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           width: width,
            //           //  color: Colors.green,

            //           margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            //           child: TextField(
            //             style: TextStyle(color: themewhite, fontSize: 18),
            //             showCursor: false,
            //             decoration: InputDecoration(
            //               border: InputBorder.none,
            //               icon: Icon(
            //                 Icons.search,
            //                 color: themewhite,
            //                 size: 35,
            //               ),
            //               hintText: "SEARCH FOR SHOPS AND HOTELS",
            //               hintStyle:
            //                   TextStyle(color: themedimwhite, fontSize: 14),
            //               focusColor: themewhite,
            //             ),
            //           ),
            //         ), //text inputbox container
            //         Divider(
            //           thickness: 7,
            //           color: themegreen,
            //           endIndent: 45,
            //           indent: 45,
            //         )
            //       ]),
            // ),
            // AdminCard(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/productEdit.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/models/fooditems.dart';
import 'package:foodieshop/services/apiUrls.dart';

class Product extends StatefulWidget {
  final FoodItems fooditem;

  const Product({Key key, this.fooditem}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themecolor,
      // appBar: FoodieAppbar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: themegreen,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return ProductEdit(
              fooditem: widget.fooditem,
            );
          }));
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: height * .45,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                ApiUrls.baseUrl + '/' + widget.fooditem.productImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.fooditem.productname.toUpperCase(),
                      style: TextStyle(
                        color: themewhite,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10),
                    //   child: RichText(
                    //     text: TextSpan(
                    //         text: 'Category :   ',
                    //         style: TextStyle(
                    //           color: themewhite,
                    //           fontSize: 16,
                    //         ),
                    //         children: [
                    //           TextSpan(
                    //             text: 'Spicy',
                    //             style: TextStyle(
                    //               color: themewhite,
                    //               fontSize: 16,
                    //             ),
                    //           ),
                    //         ]),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                        text: TextSpan(
                            text: 'Price :   ',
                            style: TextStyle(
                              color: themewhite,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: '${widget.fooditem.rate}/-',
                                style: TextStyle(
                                  color: themewhite,
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Divider(
                      thickness: 7,
                      color: themegreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.fooditem.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: themewhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/admin.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/goldWidgets/imagecard.dart';
import 'package:foodieshop/goldWidgets/textBox.dart';
import 'package:foodieshop/goldWidgets/appbar.dart';
import 'package:foodieshop/goldWidgets/colorButton.dart';
import 'package:foodieshop/models/fooditems.dart';
import 'package:foodieshop/services/productCRUD.dart';

class ProductEdit extends StatefulWidget {
  final FoodItems fooditem;

  const ProductEdit({Key key, this.fooditem}) : super(key: key);
  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  String dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.fooditem.unit;
  }

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    //Implements alert dialog
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themecolor,
            title: Text(
              'Delete product ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to delete this product',
                    style: commonTextStyle,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ColorButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                buttonColor: themegreen,
                buttonText: ('No'),
                buttonAction: () {
                  Navigator.of(context).pop();
                },
              ),
              ColorButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                buttonColor: Colors.red,
                buttonText: ('Yes'),
                buttonAction: () {
                  deleteProduct(widget.fooditem.id).then((value) => {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Admin()),
                            (Route<dynamic> route) => false)
                      });
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
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EDIT PRODUCT',
                  style: commonTextStyle,
                ),
                SizedBox(
                  height: 38,
                ),
                ImageCard(
                  image: 'images/Chicken65.jpg',
                  whitecardheight: 195,
                  whitecardwidth: 195,
                  imagecardheight: 190,
                  imagecardwidth: 190,
                ),
                SizedBox(
                  height: 30,
                ),
                TextBox1(
                  onChanged: (value) {
                    setState(() {
                      widget.fooditem.productname = value;
                    });
                  },
                  initialValue: widget.fooditem.productname,
                  margin: EdgeInsets.only(top: 25, bottom: 15),
                  hintText: 'Product Name',
                ),
                TextBox1(
                  onChanged: (value) {
                    setState(() {
                      widget.fooditem.description = value;
                    });
                  },
                  initialValue: widget.fooditem.description,
                  height: 90,
                  hintText: 'Description',
                  maxLines: 5,
                ),
                Row(children: [
                  TextBox1(
                    onChanged: (value) {
                      setState(() {
                        widget.fooditem.quantity = value;
                      });
                    },
                    initialValue: widget.fooditem.quantity,
                    margin: EdgeInsets.only(top: 25, bottom: 15),
                    hintText: 'Quantity',
                    width: 150,
                  ),
                  //DropDown List
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      dropdownColor: themedimbalck,
                      icon: Image.asset(
                        'images/arrowdown.png',
                        width: 35,
                        height: 35,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: themewhite, fontSize: 22),
                      underline: Container(
                        height: 0.1,
                        color: themegreen,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['kg', 'No.', 'gm', 'L']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  //
                ]),
                TextBox1(
                  onChanged: (value) {
                    setState(() {
                      widget.fooditem.rate = value;
                    });
                  },
                  initialValue: widget.fooditem.rate,
                  hintText: 'RS/:',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    color: themegreen,
                    thickness: 3,
                  ),
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
                          buttonText: 'DELETE',
                          padding: wt > 600
                              ? EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 23, vertical: 8),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ColorButton(
                          buttonAction: () async {
                            setState(() {
                              widget.fooditem.unit = dropdownValue;
                            });
                            await updateFoodItem(widget.fooditem)
                                .then((value) => {
                                      value
                                          ? Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                              return Admin();
                                            }))
                                          : null
                                    });
                          },
                          buttonColor: themegreen,
                          buttonText: 'UPDATE',
                          padding: wt > 600
                              ? EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 23, vertical: 8),
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

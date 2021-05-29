import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/admin.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/textBox.dart';
import 'package:foodieadmin/model/shopdetails.dart';
import 'package:foodieadmin/services/deleteshopdetails.dart';
import 'package:foodieadmin/services/editshopdetails.dart';

import 'admin.dart';

class ShopEdit extends StatefulWidget {
  final Shop shop;

  const ShopEdit({Key key, this.shop}) : super(key: key);
  @override
  _ShopEditState createState() => _ShopEditState();
}

class _ShopEditState extends State<ShopEdit> {
  // Future<Shop> _response;
  String hotelsname;
  String hotelslocation;
  String hotelsaddress;
  String pincode;
  String ownersname;
  String ownersaddress;
  String contactnumber;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themecolor,
            title: Text(
              'Delete Account ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to delete this shop',
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
                    deleteshopdetails(widget.shop.id).then((value) {
                      if (value == true) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return Admin();
                        }), (route) => false);
                      } else {
                        SnackBar snackBar = SnackBar(
                            content:
                                Text('Delete operation failed. Try again'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  }),
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
                  'Edit Shop Account',
                  style: commonTextStyle,
                ),
                TextBox(
                  margin: EdgeInsets.only(top: 25, bottom: 15),
                  hintText: 'Hotel\'s Name',
                  initialvalue: widget.shop.hotelsname,
                  onChanged: (value) {
                    setState(() {
                      hotelsname = value;
                    });
                  },
                ),
                TextBox(
                  hintText: 'Hotel\'s Location, Landmark',
                  initialvalue: widget.shop.hotelslocation,
                  onChanged: (value) {
                    setState(() {
                      hotelslocation = value;
                    });
                  },
                ),
                TextBox(
                  height: 90,
                  hintText: 'Hotel\'s Address',
                  initialvalue: widget.shop.hotelsaddress,
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      hotelsaddress = value;
                    });
                  },
                ),
                TextBox(
                  hintText: 'pincode',
                  initialvalue: widget.shop.pincode.toString(),
                  onChanged: (value) {
                    setState(() {
                      pincode = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    color: themegreen,
                    thickness: 3,
                  ),
                ),
                TextBox(
                  hintText: 'Owner\'s Name',
                  initialvalue: widget.shop.ownersname,
                  onChanged: (value) {
                    setState(() {
                      ownersname = value;
                    });
                  },
                ),
                TextBox(
                  maxLines: 5,
                  height: 90,
                  hintText: 'Owner\'s Address',
                  initialvalue: widget.shop.ownersaddress,
                  onChanged: (value) {
                    setState(() {
                      ownersaddress = value;
                    });
                  },
                ),
                TextBox(
                  hintText: 'Contact Number',
                  initialvalue: widget.shop.contactnumber.toString(),
                  onChanged: (value) {
                    setState(() {
                      contactnumber = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    color: themegreen,
                    thickness: 3,
                  ),
                ),
                TextBox(
                  hintText: 'Email',
                  initialvalue: widget.shop.email,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                TextBox(
                  hintText: 'Password',
                  initialvalue: widget.shop.password,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
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
                          buttonText: 'DELETE ACCOUNT',
                          padding: wt > 400
                              ? EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ColorButton(
                          buttonAction: () {
                            editshopdetails(hotelsname, widget.shop.id)
                                .then((value) {
                              if (value == true) {
                                print("updated");
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Admin()));
                              } else {
                                print("update failed");
                              }
                            });
                          },
                          // ignore: todo
                          //TODO: update hotel/shop details in database !
                          buttonColor: themegreen,
                          buttonText: 'UPDATE',
                          padding: wt > 400
                              ? EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 23, vertical: 16),
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

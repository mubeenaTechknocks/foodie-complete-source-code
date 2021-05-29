import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/admin.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/textBox.dart';
import 'package:foodieadmin/services/postshopdetails.dart';

import '../model/shopdetails.dart';

class ShopAdd extends StatefulWidget {
  @override
  _ShopAddState createState() => _ShopAddState();
}

class _ShopAddState extends State<ShopAdd> {
  TextEditingController _hotelsnameController = TextEditingController();
  TextEditingController _hotelslocationController = TextEditingController();
  TextEditingController _hotelsaddressController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _ownersnameController = TextEditingController();
  TextEditingController _ownersaddressController = TextEditingController();
  TextEditingController _contactnumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<Shop> _response;

  // @override
  // void initState() {
  // ignore: todo
  //   // TODO: implement initState
  //   super.initState();
  //   _response = null;
  // }
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themedimbalck,
            title: Text(
              'Discard Changes ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to discard all changes',
                    style: commonTextStyle,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ColorButton(
                padding: wt > 600
                    ? EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                    : EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                buttonColor: themegreen,
                buttonText: ('No'),
                buttonAction: () {
                  Navigator.of(context).pop();
                },
              ),
              ColorButton(
                padding: wt > 600
                    ? EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                    : EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                buttonColor: Colors.red,
                buttonText: ('Yes'),
                buttonAction: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Admin()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _showMyDialog();
              }),
          automaticallyImplyLeading: false,
        ),
        body: (_response == null)
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Shop Account',
                          style: commonTextStyle,
                        ),
                        TextBox(
                          margin: EdgeInsets.only(top: 25, bottom: 15),
                          hintText: 'Hotel\'s Name',
                          controller: _hotelsnameController,
                        ),
                        TextBox(
                          hintText: 'Hotel\'s Location, Landmark',
                          controller: _hotelslocationController,
                        ),
                        TextBox(
                          height: 90,
                          hintText: 'Hotel\'s Address',
                          controller: _hotelsaddressController,
                          maxLines: 5,
                        ),
                        TextBox(
                          hintText: 'pincode',
                          controller: _pincodeController,
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
                          controller: _ownersnameController,
                        ),
                        TextBox(
                          maxLines: 5,
                          height: 90,
                          hintText: 'Owner\'s Address',
                          controller: _ownersaddressController,
                        ),
                        TextBox(
                          hintText: 'Contact Number',
                          controller: _contactnumberController,
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
                          controller: _emailController,
                        ),
                        TextBox(
                          hintText: 'Password',
                          controller: _passwordController,
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
                                  buttonText: 'CANCEL',
                                  padding: wt > 400
                                      ? EdgeInsets.symmetric(
                                          horizontal: 45, vertical: 20)
                                      : EdgeInsets.symmetric(
                                          horizontal: 23, vertical: 16),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ColorButton(
                                  buttonAction: () {
                                    setState(() {
                                      _response = postdata(
                                        hotelsname: _hotelsnameController.text,
                                        hotelslocation:
                                            _hotelslocationController.text,
                                        hotelsaddress:
                                            _hotelsaddressController.text,
                                        pincode:
                                            _pincodeController.text.toString(),
                                        ownersaddress:
                                            _ownersaddressController.text,
                                        ownersname: _ownersnameController.text,
                                        contactnumber:
                                            _contactnumberController.text,
                                        email: _emailController.text.toString(),
                                        password:
                                            _passwordController.text.toString(),
                                      );
                                    });
                                  },
                                  buttonColor: themegreen,
                                  buttonText: 'CREATE',
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
              )
            : FutureBuilder<Shop>(
                future: _response,
                builder: (context, snap) {
                  if (snap.hasData) {
                    // Shop shop = snap.data;
                    print(snap.data);
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   snap.data.hotelsname,
                          //   style: TextStyle(color: Colors.white, fontSize: 23),
                          // ),
                          Text(
                            'Saved successfully',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return Admin();
                              }), (route) => false);
                            },
                            color: themegreen,
                            child: Text(
                              'Return to home',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (snap.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ));
  }
}

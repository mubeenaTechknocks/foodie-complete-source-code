import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/admin.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/textBox.dart';

class EditDeliveryBoys extends StatefulWidget {
  @override
  _EditDeliveryBoysState createState() => _EditDeliveryBoysState();
}

class _EditDeliveryBoysState extends State<EditDeliveryBoys> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    print('width $wt');
    print('height $ht');
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
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => Admin()),
                  );
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
                  'EDIT DELIVERY BOY',
                  style: commonTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                TextBox(
                  margin: EdgeInsets.only(top: 25, bottom: 15),
                  hintText: 'Name',
                ),
                TextBox(
                  hintText: 'Mobile Number',
                ),
                TextBox(
                  hintText: 'Salary',
                ),
                TextBox(
                  height: 90,
                  hintText: 'Notes.',
                  maxLines: 5,
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
                          buttonAction: () {
                            //Add new hotel/shope to the database !!!!
                            print('Create a new hotel entry');
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

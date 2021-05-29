import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/DeliveryBoysRequests.dart';
import 'package:foodieadmin/goldPages/shopDetails.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/attachmentButton.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/title.dart';
import 'package:foodieadmin/model/deliveryboys.dart';


class DeliveryBoyDetailsForAccept extends StatefulWidget {
  final Deliveryboys deliveryboys;

  const DeliveryBoyDetailsForAccept({Key key, this.deliveryboys}) : super(key: key);
  @override
  _DeliveryBoyDetailsForAcceptState createState() =>
      _DeliveryBoyDetailsForAcceptState();
}

class _DeliveryBoyDetailsForAcceptState
    extends State<DeliveryBoyDetailsForAccept> {
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
              'Reject request ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to reject this request',
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  buttonColor: Colors.red,
                  buttonText: ('Yes'),
                  buttonAction: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DeliverboysRequest()));
                    // ignore: todo
                    //TODO: remove request from list
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodieTitle(
                  title: 'PERSONAL INFO',
                ),
                SizedBox(height: 30),
                FoodieList(
                  data:widget.deliveryboys.name,
                ),
                FoodieAddress(
                  address: widget.deliveryboys.houseName   ,
                  multiline: true,
                ),
                FoodieList(
                  data: widget.deliveryboys.age,
                ),
                FoodieList(
                  data: widget.deliveryboys.phone,
                ),
                FoodieList(
                  data: widget.deliveryboys.bloodGroup,
                ),
                line,
                FoodieTitle(title: 'Vechicle Details'),
                SizedBox(height: 30),
                FoodieList(
                  data: widget.deliveryboys.licenceNo,
                ),
                FoodieList(
                  data: widget.deliveryboys.vehicleModel,
                ),
                FoodieAddress(
                  address: widget.deliveryboys.vehicleColor,
                ),
                FoodieList(
                  data: widget.deliveryboys.regNo,
                ),
                SizedBox(
                  width: wt * .82,
                  child: Row(children: [
                    AttachmentButton(title: "Download License"),
                    VerticalDivider(),
                    AttachmentButton(title: "Download RC"),
                  ]),
                ),
                SizedBox(height: 20),
                line,
                SizedBox(height: 10),
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
                          buttonText: 'REJECT',
                          padding: wt > 400
                              ? EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ColorButton(
                          buttonAction: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeliverboysRequest()));
                            // ignore: todo
                            //TODO: Add new delivery boy to the database !!!!
                            // ignore: todo
                            //TODO: Remove this entry from requests list
                          },
                          buttonColor: themegreen,
                          buttonText: 'ACCEPT',
                          padding: wt > 400
                              ? EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 23, vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:foodie_delivery/pages/walletNotifier.dart';
import 'package:foodie_delivery/services/orderServices.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/greenButton.dart';

class CODPayment extends StatefulWidget {
  final String id;
  final double deliveryCharge;

  const CODPayment({Key key, this.id, this.deliveryCharge}) : super(key: key);
  @override
  _CODPaymentState createState() => _CODPaymentState();
}

class _CODPaymentState extends State<CODPayment> {
  bool payed = false;
  bool hide = true;

  void payedset() {
    setState(() {
      payed = !payed;
      payed = true;
      hide = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: hide,
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Collected Amount of RS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    border: Border.all(color: themegreen, width: 2),
                  ),
                  child: TextField(
                    showCursor: false,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Amount',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GreenButton(
                  onPressed: () {
                    payedset();
                  },
                  buttonText: 'CONFIRM',
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: payed,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  tickgif,
                  width: 120,
                  height: 120,
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  'Payment Completed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Divider(
                  thickness: 20,
                  color: Colors.white,
                ),
                GreenButton(
                  onPressed: () {
                    updateOrderStatus(widget.id, 'delivered').then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return WalletNotifier(
                            deliverycharge: widget.deliveryCharge);
                      }));
                    });
                  },
                  buttonText: 'DELIVERED',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

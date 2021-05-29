import 'package:flutter/material.dart';
import 'package:foodie_delivery/pages/walletNotifier.dart';
import 'package:foodie_delivery/services/orderServices.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/greenButton.dart';

class AlreadyPayed extends StatelessWidget {
  final String id;
  final double deliveryCharge;

  const AlreadyPayed({Key key, this.id, this.deliveryCharge}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            tick,
            width: 120,
            height: 120,
          ),
          Divider(
            color: Colors.white,
          ),
          Text(
            'Already Paid',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          GreenButton(
            onPressed: () {
              updateOrderStatus(id, 'delivered').then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return WalletNotifier(deliverycharge: deliveryCharge);
                }));
              });
            },
            buttonText: 'DELIVERED',
          ),
        ],
      ),
    );
  }
}

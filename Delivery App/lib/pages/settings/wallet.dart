import 'package:flutter/material.dart';
import 'package:foodie_delivery/animations/enterExitAniation.dart';
import 'package:foodie_delivery/pages/settings/deliveryHistory.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/wallet/background.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themegreen,
        elevation: 0.5,
      ),
      body: Background(
        child: Container(
          // color: Colors.red,
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .45,
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Cc(
                    onTap: () {
                      //TODO: Route to the page
                    },
                    icon: Icons.compare_arrows,
                    text: 'Transfer to Bank Account',
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Cc(
                    icon: Icons.account_balance,
                    text: 'Account Settings',
                    onTap: () {
                      //TODO: Route to the page
                    },
                    border: Border(
                      right: BorderSide(color: Colors.grey),
                    ),
                  ),
                  Cc(
                    onTap: () {
                      Navigator.push(
                          context,
                          EnterExitRoute(
                            exitPage: this,
                            enterPage: DeliveryHistory(),
                          ));
                    },
                    icon: Icons.access_time,
                    text: 'Delivery History',
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Cc extends StatelessWidget {
  final BoxBorder border;
  final Function() onTap;
  final IconData icon;
  final String text;

  const Cc({Key key, this.border, this.onTap, this.icon, this.text = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: border,
            ),
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.width * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    icon,
                    size: 35,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

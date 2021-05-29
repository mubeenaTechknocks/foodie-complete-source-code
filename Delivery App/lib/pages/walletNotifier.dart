import 'package:flutter/material.dart';
import 'package:foodie_delivery/pages/home.dart';
import 'package:foodie_delivery/setting.dart';

class WalletNotifier extends StatefulWidget {
  final double deliverycharge;

  const WalletNotifier({Key key, this.deliverycharge}) : super(key: key);
  @override
  _WalletNotifierState createState() => _WalletNotifierState();
}

class _WalletNotifierState extends State<WalletNotifier> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return Home(
        activeOrder: false,
      );
    }), (route) => false);
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: themecolor,
      body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'images/wallet.gif',
              width: width,
            ),
            SizedBox(height: 20),
            TitleText(
              title:
                  "You have earned ₹${widget.deliverycharge} from this delivery",
            )
          ])),
    );
  }
}

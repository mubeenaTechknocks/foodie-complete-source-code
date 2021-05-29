import 'package:flutter/material.dart';
import 'package:foodie_delivery/setting.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .1,
            ),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(10.0)),
              color: themegreen,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .09,
          left: 15,
          right: 15,
          child: Column(
            children: [
              Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.height * .90,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Cash on Wallet',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₹ 13498.72',
                          style: TextStyle(
                            fontSize: 35,
                            color: themegreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child
            ],
          ),
        ),
      ],
    );
  }
}

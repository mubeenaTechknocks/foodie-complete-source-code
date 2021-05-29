import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/sliverlist.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';

class TodayOverView extends StatefulWidget {
  final String hotelName;

  const TodayOverView({Key key, this.hotelName}) : super(key: key);
  @override
  _TodayOverViewState createState() => _TodayOverViewState();
}

class _TodayOverViewState extends State<TodayOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      appBar: FoodieAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CollapsingList(hotelName: widget.hotelName),
      ),
    );
  }
}

// class PageCard extends StatefulWidget {
//   final String cardTitle;
//   final String amount;
//   final Deliveredorders deliveredorders;
//   final Color numberColor;

//   const PageCard({Key key, this.cardTitle, this.amount, this.numberColor, this.deliveredorders})
//       : super(key: key);
//   @override
//   _PageCardState createState() => _PageCardState();
// }

// class _PageCardState extends State<PageCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Container(
//         color: themedimbalck,
//         height: 150,
//         width: double.maxFinite,
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 widget.deliveredorders.hotelsname,
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 widget.deliveredorders.quantity,
//                 style: TextStyle(
//                     fontSize: 45,
//                     color: widget.numberColor,
//                     fontWeight: FontWeight.bold),
//               ),
//             ]),
//       ),
//     );
//   }
// }

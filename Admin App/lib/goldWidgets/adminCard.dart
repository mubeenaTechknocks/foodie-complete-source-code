// import 'package:flutter/material.dart';
// import 'package:foodieadmin/goldWidgets/card.dart';
// import 'package:foodieadmin/model/shopdetails.dart';
// import 'package:foodieadmin/services/getshopdetails.dart';

// class AdminCard extends StatefulWidget {
//   @override
//   _AdminCardState createState() => _AdminCardState();
// }

// class _AdminCardState extends State<AdminCard> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Container(
//       height: height * 0.73,
//       child: Center(
//         child: Container(
//           margin: EdgeInsets.symmetric(
//             vertical: 10,
//             horizontal: 28,
//           ),
//           child: Container(
//             margin: EdgeInsets.symmetric(
//               vertical: 10,
//             ),
//             child: FutureBuilder(
//               future: gethotels(),
//                           builder:(context,snapShot){
//                             if(snapShot.hasData){
//                             return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
//                 itemCount: snapShot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Shop shop=snapShot.data[index];
//                   return ShopCard(
//                     shop: shop,
//                     // location: "Thrissur ,Town",
//                     // mobile: "9895301845",
//                     // hotelname: "Spoon",
//                     location: shop.hotelslocation,
//                     mobile: shop.contactnumber.toString(),
//                     hotelname: shop.hotelsname,
//                   );
//                 },
//               );}else if(snapShot.hasError){
//                return Center(child:Text('Loading Failed'));
//               } else {
//                 return Center(child: CircularProgressIndicator(),);
//               }}
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

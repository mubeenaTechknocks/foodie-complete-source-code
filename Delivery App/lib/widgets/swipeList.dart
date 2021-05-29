import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/pages/orderAccept.dart';
import 'package:foodie_delivery/widgets/incomingOrderCard.dart';
import 'package:location/location.dart';

class SwipeList extends StatefulWidget {
  final List<OrdersModel> orders;
  final LocationData locationdata;
  const SwipeList({Key key, this.orders, this.locationdata}) : super(key: key);
  @override
  _SwipeListState createState() => _SwipeListState(orders);
}

class _SwipeListState extends State<SwipeList> {
  final List<OrdersModel> orders;

  _SwipeListState(this.orders);

  OrdersModel order;
  OrdersModel deleted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            
            return IncomingOrderCard(
              order: orders[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderAccept(
                        order: orders[index],
                      );
                    },
                  ),
                );
              },
              
            );
          },
        ),
      ),
    );
  }
}



// class SwipeList extends StatefulWidget {
//   final List<OrdersModel> orders;
//   final LocationData locationdata;
//   const SwipeList({Key key, this.orders, this.locationdata}) : super(key: key);
//   @override
//   _SwipeListState createState() => _SwipeListState(orders);
// }

// class _SwipeListState extends State<SwipeList> {
//   final List<OrdersModel> orders;

//   _SwipeListState(this.orders);

//   OrdersModel order;
//   OrdersModel deleted;

//   @override
//   Widget build(BuildContext context) {
  
//     return Expanded(
//       child: Scaffold(
//         body: ListView.builder(
//           itemCount: orders.length,
//           itemBuilder: (context, index) {
//             return Dismissible(
//               key: UniqueKey(),
//               onDismissed: (direction) {
//                 if (direction == DismissDirection.endToStart) {
//                   setState(() {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return OrderAccept(
//                         order: orders[index],
//                       );
//                     }));
//                     // orders.remove(orders[index]);
//                   });
//                 } else if (direction == DismissDirection.startToEnd) {
//                   setState(() {
//                     deleted = orders[index];
//                   });
//                   ScaffoldMessenger.of(context).removeCurrentSnackBar();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       duration: Duration(seconds: 5),
//                       content: Text("Deleted"),
//                       action: SnackBarAction(
//                           label: "UNDO",
//                           onPressed: () => setState(
//                                 () => orders.insert(index, deleted),
//                               ) // this is what you needed
//                           ),
//                     ),
//                   );
//                 }
//               },
//               background: Accept(),
//               secondaryBackground: Reject(),
//               child: IncomingOrderCard(
//                 order: orders[index],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Reject extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       child: Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(
//           left: 200,
//         ),
//         child: Text("Accept",
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//             )),
//       ),
//     );
//   }
// }

// class Accept extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(
//           right: 200,
//         ),
//         child: Text("Reject",
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/widgets/appbar.dart';
import 'package:foodie_delivery/widgets/orderDetails/adressSection.dart';
import 'package:foodie_delivery/widgets/orderDetails/orderDetailsSection.dart';
import 'package:foodie_delivery/widgets/orderDetails/paymentSection.dart';

class OrderDetails extends StatefulWidget {
  final OrdersModel order;

  const OrderDetails({Key key, this.order}) : super(key: key);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FoodieAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdressSection(
              adresstitle: 'Pickup Adress',
              address: widget.order.hotelname +
                  '\n' +
                  widget.order.hoteladdressplace +
                  '\n' +
                  widget.order.hoteladdresscity,
            ),
            AdressSection(
              adresstitle: 'Delivery Adress',
              address: widget.order.username +
                      '\n' +
                      widget.order.housename +
                      '\n' +
                      widget.order.street ??
                  '' + '\n' + widget.order.street ??
                  '' + '\n' + widget.order.city ??
                  '',
            ),
            OrderDetailsSection(order: widget.order),
            PaymentSection(
              order: widget.order,
            ),
          ],
        ),
      ),
    );
  }
}
// class OrderDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: FoodieAppbar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             AdressSection(
//               adresstitle: 'Pickup Adress',
//               address: 'Spoon Restaurant\nEastFort\nThrissur',
//             ),
//             AdressSection(
//               adresstitle: 'Delivery Adress',
//               address:
//                   'Steve Jobs\nFlat No: 2A \nSobha City \nPuzhakkal\nThrissur',
//             ),
//             OrderDetailsSection(),
//             PaymentSection(),
            
//           ],
//         ),
//       ),
//     );
//   }
// }

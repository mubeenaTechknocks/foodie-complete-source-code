import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/widgets/orderDetails/alreadyPayed.dart';
import 'package:foodie_delivery/widgets/orderDetails/codPayment.dart';
import 'package:foodie_delivery/widgets/orderDetails/orderDetailsSection.dart';

class PaymentSection extends StatefulWidget {
  final OrdersModel order;

  const PaymentSection({Key key, this.order}) : super(key: key);
  @override
  _PaymentSectionState createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  bool alreadyPaid;

  @override
  void initState() {
    super.initState();
    if (widget.order.payment == 'online') {
      alreadyPaid = true;
    } else {
      alreadyPaid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double deliveryCharge = (int.parse(widget.order.itemRate) * .12);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Payment Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          RowText(
              needCenter: false,
              leftText: 'Payment method :',
              rightText: alreadyPaid ? 'Digital Payment' : 'Cash On Delivery'),
          alreadyPaid
              ? AlreadyPayed(
                  id: widget.order.id, deliveryCharge: deliveryCharge)
              : CODPayment(id: widget.order.id, deliveryCharge: deliveryCharge),
          // GreyLine(),
        ]),
      ),
    );
  }
}


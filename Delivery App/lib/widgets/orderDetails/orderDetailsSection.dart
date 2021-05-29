import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/widgets/greyLine.dart';

class OrderDetailsSection extends StatelessWidget {
  final OrdersModel order;

  const OrderDetailsSection({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int orderId = (int.parse(order.phno) - 900000000);
    double tax = (int.parse(order.itemRate) * .18);
    double deliveryCharge = (int.parse(order.itemRate) * .1);
    double total = int.parse(order.itemRate) + deliveryCharge + tax;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Details\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: RowText(
              leftText: 'Order ID :',
              rightText: '#$orderId',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: RowText(
              leftText: 'item(s)',
              centerText: 'Quantity',
              rightText: 'Amount',
            ),
          ),

          //NEED TO FIND A DYNAMIC WAY FROM HERE

          RowText(
            leftText: order.itemName,
            centerText: order.quantity,
            rightText: order.itemRate,
          ),
          // RowText(
          //   leftText: 'Porotta',
          //   centerText: '10 Nos',
          //   rightText: '100',
          // ),
          // RowText(
          //   leftText: 'Lime Juice',
          //   centerText: '4 Nos',
          //   rightText: '80',
          // ),
          GreyLine(),

          // TO HERE

          RowText(
            leftText: 'Tax:',
            rightText: tax.toString(),
          ),
          RowText(
            leftText: 'Delivery charge:',
            rightText: deliveryCharge.toString(),
          ),
          GreyLine(),
          RowText(
            leftText: 'Total',
            rightText: '₹ $total',
          ),
          GreyLine(),
        ],
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String leftText;
  final String rightText;
  final String centerText;
  final bool needCenter;

  const RowText(
      {Key key,
      this.leftText = '',
      this.rightText = '',
      this.centerText = '',
      this.needCenter = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Text(
                leftText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          VerticalDivider(),
          needCenter
              ? Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Text(
                      centerText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          VerticalDivider(),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Text(
                rightText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodieshop/models/fooditems.dart';
import 'package:foodieshop/services/productCRUD.dart';

class SwitchAvailability extends StatefulWidget {
  final FoodItems fooditem;

  const SwitchAvailability({
    Key key,
    this.fooditem,
  }) : super(key: key);
  @override
  _SwitchAvailabilityState createState() => _SwitchAvailabilityState();
}

class _SwitchAvailabilityState extends State<SwitchAvailability> {
  bool isSwitched = true;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.fooditem.available;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          widget.fooditem.available = isSwitched;
          updateFoodItem(widget.fooditem);
        });
      },
      inactiveTrackColor: Colors.grey[500],
      activeTrackColor: Colors.lightGreenAccent[700],
      activeColor: Colors.white,
    );
  }
}

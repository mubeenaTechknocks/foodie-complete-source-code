// import 'package:flutter/material.dart';
// import 'package:foodie_delivery/models/orderDetails.dart';

// Future<OrderDetailsModel> loadjson() async {
//   final jsondata =
//       DefaultAssetBundle.of(context).loadString("assets/data.json");
// }

import 'package:flutter/services.dart';
// import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/models/usermodel.dart';

// Future<List<OrderDetailsModel>> loadJson() async {
//   String data = await rootBundle.loadString('assets/model.json');
//   final jsonResult = orderDetailsModelFromJson(data);
//   // print(jsonResult);
//   return jsonResult;
// }


Future<UserModel> loadusermodel() async {
  String data = await rootBundle.loadString('assets/usermodel.json');
  final jsonResult = userModelFromJson(data);
  // print(jsonResult);
  return jsonResult;
}

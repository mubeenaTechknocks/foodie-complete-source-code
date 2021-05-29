import 'dart:convert';

import 'package:foodie_delivery/models/ordersModel.dart';
import 'package:foodie_delivery/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<List<OrdersModel>> getOrders() async {
  var url = Uri.parse(ApiUrls.orders);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var body = ordersModelFromJson(response.body);
    return body;
  } else {
    throw Exception('failed to load');
  }
}

Future<bool> updateOrderStatus(String id, String status) async {
  var url = Uri.parse(ApiUrls.orders + '/$id');

  var response = await http.patch(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"statusdetails": status}));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

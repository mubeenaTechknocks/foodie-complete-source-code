import 'dart:convert';

import 'package:foodieshop/models/fooditems.dart';
import 'package:foodieshop/services/apiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<FoodItems>> loadProducts() async {
  var url = Uri.parse(ApiUrls.products);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var body = foodItemsFromJson(response.body);
    return body;
  } else {
    throw Exception('failed to load');
  }
}

Future<FoodItems> addProduct(FoodItems foodAdd) async {
  final hotelsname = await gethoteldetails('hotelname');
  final hoteladdressplace = await gethoteldetails('hotelplace');
  final hoteladdresscity = await gethoteldetails('hotelcity');
  final hotelnumber = await gethoteldetails('number');
  var url = Uri.parse(ApiUrls.products);
  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "productname": foodAdd.productname,
        "description": foodAdd.description,
        "quantity": foodAdd.quantity,
        "unit": foodAdd.unit,
        "rate": foodAdd.rate,
        "hotelname": hotelsname,
        "available": true,
        "hoteladdressplace": hoteladdressplace,
        "hotelphonenumber": hotelnumber,
        "hoteladdresscity": hoteladdresscity,
        "hotellatitude": "34567.6543",
        "hotellongitude": "12345.456",
      }));
  if (response.statusCode == 200) {
    var body = FoodItems.fromJson(jsonDecode(response.body));
    return body;
  } else {
    print(response.body);
    throw Exception('failed to load');
  }
}

Future<bool> updateFoodItem(FoodItems fooditem) async {
  final hotelsname = await gethoteldetails('hotelname');
  final hoteladdressplace = await gethoteldetails('hotelplace');
  final hoteladdresscity = await gethoteldetails('hotelcity');
  final hotelnumber = await gethoteldetails('number');
  print(hotelsname);
  print(hoteladdressplace);
  print(hoteladdresscity);
  print(hotelnumber);

  var url = Uri.parse(ApiUrls.products + '/${fooditem.id}');
  var response = await http.patch(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "productname": fooditem.productname,
        "description": fooditem.description,
        "quantity": fooditem.quantity,
        "unit": fooditem.unit,
        "rate": fooditem.rate,
        "hotelname": hotelsname,
        "available": fooditem.available,
        "hoteladdressplace": hoteladdressplace,
        "hotelphonenumber": hotelnumber,
        "hoteladdresscity": hoteladdresscity,
        "hotellatitude": "34567.6543",
        "hotellongitude": "12345.456",
      }));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future deleteProduct(String id) async {
  var url = Uri.parse(ApiUrls.products + '/$id');
  var response = await http.delete(
    url,
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('failed to load');
  }
}

Future<String> gethoteldetails(String reference) async {
  final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
  final hotelname = prefs.getString(reference) ?? " ";

  return hotelname;
}

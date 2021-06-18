// To parse this JSON data, do
//
//     final foodItems = foodItemsFromJson(jsonString);

import 'dart:convert';

List<FoodItems> foodItemsFromJson(String str) =>
    List<FoodItems>.from(json.decode(str).map((x) => FoodItems.fromJson(x)));

String foodItemsToJson(List<FoodItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodItems {
  FoodItems({
    this.id,
    this.productname,
    this.description,
    this.quantity,
    this.unit,
    this.rate,
    this.hotelname,
    this.available,
    this.hoteladdressplace,
    this.hotelphonenumber,
    this.hoteladdresscity,
    this.hotellatitude,
    this.hotellongitude,
    this.productImage,
    this.date,
    this.v,
  });

  String id;
  String productname;
  String description;
  String quantity;
  String unit;
  String rate;
  String hotelname;
  bool available;
  String hoteladdressplace;
  int hotelphonenumber;
  String hoteladdresscity;
  String hotellatitude;
  String hotellongitude;
  String productImage;
  DateTime date;
  int v;

  factory FoodItems.fromJson(Map<String, dynamic> json) => FoodItems(
        id: json["_id"],
        productname: json["productname"],
        description: json["description"],
        quantity: json["quantity"],
        unit: json["unit"],
        rate: json["rate"],
        hotelname: json["hotelname"],
        available: json["available"],
        hoteladdressplace: json["hoteladdressplace"],
        hotelphonenumber: json["hotelphonenumber"],
        hoteladdresscity: json["hoteladdresscity"],
        hotellatitude: json["hotellatitude"],
        hotellongitude: json["hotellongitude"],
        productImage: json["productImage"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "description": description,
        "quantity": quantity,
        "unit": unit,
        "rate": rate,
        "hotelname": hotelname,
        "available": available,
        "hoteladdressplace": hoteladdressplace,
        "hotelphonenumber": hotelphonenumber,
        "hoteladdresscity": hoteladdresscity,
        "hotellatitude": hotellatitude,
        "hotellongitude": hotellongitude,
        "date": date.toIso8601String(),
        "__v": v,
      };
}

// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

List<OrdersModel> ordersModelFromJson(String str) => List<OrdersModel>.from(json.decode(str).map((x) => OrdersModel.fromJson(x)));

String ordersModelToJson(List<OrdersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersModel {
    OrdersModel({
        this.id,
        this.statusdetails,
        this.orderdate,
        this.payment,
        this.housename,
        this.street,
        this.city,
        this.itemName,
        this.itemRate,
        this.quantity,
        this.username,
        this.phno,
        this.userlatitude,
        this.userlongitude,
        this.date,
        this.v,
    });

    String id;
    String statusdetails;
    String orderdate;
    String payment;
    String housename;
    String street;
    String city;
    String itemName;
    String itemRate;
    String quantity;
    String username;
    String phno;
    String userlatitude;
    String userlongitude;
    DateTime date;
    int v;

    factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json["_id"],
        statusdetails: json["statusdetails"],
        orderdate: json["orderdate"],
        payment: json["payment"],
        housename: json["housename"],
        street: json["street"],
        city: json["city"],
        itemName: json["itemName"],
        itemRate: json["itemRate"],
        quantity: json["quantity"],
        username: json["username"],
        phno: json["phno"],
        userlatitude: json["userlatitude"],
        userlongitude: json["userlongitude"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "statusdetails": statusdetails,
        "orderdate": orderdate,
        "payment": payment,
        "housename": housename,
        "street": street,
        "city": city,
        "itemName": itemName,
        "itemRate": itemRate,
        "quantity": quantity,
        "username": username,
        "phno": phno,
        "userlatitude": userlatitude,
        "userlongitude": userlongitude,
        "date": date.toIso8601String(),
        "__v": v,
    };
}

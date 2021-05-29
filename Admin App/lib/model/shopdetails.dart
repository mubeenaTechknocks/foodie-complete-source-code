// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';

List<Shop> shopFromJson(String str) => List<Shop>.from(json.decode(str).map((x) => Shop.fromJson(x)));

String shopToJson(List<Shop> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shop {
    Shop({
        this.id,
        this.hotelsname,
        this.hotelslocation,
        this.hotelsaddress,
        this.pincode,
        this.ownersname,
        this.ownersaddress,
        this.contactnumber,
        this.email,
        this.password,
        this.v,
    });

    String id;
    String hotelsname;
    String hotelslocation;
    String hotelsaddress;
    int pincode;
    String ownersname;
    String ownersaddress;
    int contactnumber;
    String email;
    String password;
    int v;

    factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["_id"],
        hotelsname: json["Hotelsname"],
        hotelslocation: json["Hotelslocation"],
        hotelsaddress: json["Hotelsaddress"],
        pincode: json["Pincode"],
        ownersname: json["Ownersname"],
        ownersaddress: json["Ownersaddress"],
        contactnumber: json["Contactnumber"],
        email: json["Email"],
        password: json["Password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Hotelsname": hotelsname,
        "Hotelslocation": hotelslocation,
        "Hotelsaddress": hotelsaddress,
        "Pincode": pincode,
        "Ownersname": ownersname,
        "Ownersaddress": ownersaddress,
        "Contactnumber": contactnumber,
        "Email": email,
        "Password": password,
        "__v": v,
    };
}

// To parse this JSON data, do
//
//     final subadminals = subadminalsFromJson(jsonString);

import 'dart:convert';

List<Subadminals> subadminalsFromJson(String str) => List<Subadminals>.from(json.decode(str).map((x) => Subadminals.fromJson(x)));

String subadminalsToJson(List<Subadminals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subadminals {
    Subadminals({
        this.id,
        this.name,
        this.contactnumber,
        this.address,
        this.pincode,
        this.email,
        this.password,
        this.v,
    });

    String id;
    String name;
    String contactnumber;
    String address;
    int pincode;
    String email;
    String password;
    int v;

    factory Subadminals.fromJson(Map<String, dynamic> json) => Subadminals(
        id: json["_id"],
        name: json["Name"],
        contactnumber: json["Contactnumber"],
        address: json["Address"],
        pincode: json["Pincode"],
        email: json["Email"],
        password: json["Password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Contactnumber": contactnumber,
        "Address": address,
        "Pincode": pincode,
        "Email": email,
        "Password": password,
        "__v": v,
    };
}

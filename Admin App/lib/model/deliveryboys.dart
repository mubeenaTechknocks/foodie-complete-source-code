
import 'dart:convert';

List<Deliveryboys> deliveryboysFromJson(String str) => List<Deliveryboys>.from(json.decode(str).map((x) => Deliveryboys.fromJson(x)));

String deliveryboysToJson(List<Deliveryboys> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Deliveryboys {
    Deliveryboys({
        this.id,
        this.email,
        this.password,
        this.name,
        this.age,
        this.phone,
        this.bloodGroup,
        this.houseName,
        this.postOffice,
        this.city,
        this.pincode,
        this.licenceNo,
        this.vehicleModel,
        this.vehicleColor,
        this.regNo,
        this.date,
        this.v,
    });

    String id;
    String email;
    String password;
    String name;
    String age;
    String phone;
    String bloodGroup;
    String houseName;
    String postOffice;
    String city;
    String pincode;
    String licenceNo;
    String vehicleModel;
    String vehicleColor;
    String regNo;
    DateTime date;
    int v;

    factory Deliveryboys.fromJson(Map<String, dynamic> json) => Deliveryboys(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        age: json["age"],
        phone: json["phone"],
        bloodGroup: json["bloodGroup"],
        houseName: json["houseName"],
        postOffice: json["postOffice"],
        city: json["city"],
        pincode: json["pincode"],
        licenceNo: json["licenceNo"],
        vehicleModel: json["vehicleModel"],
        vehicleColor: json["vehicleColor"],
        regNo: json["regNo"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "name": name,
        "age": age,
        "phone": phone,
        "bloodGroup": bloodGroup,
        "houseName": houseName,
        "postOffice": postOffice,
        "city": city,
        "pincode": pincode,
        "licenceNo": licenceNo,
        "vehicleModel": vehicleModel,
        "vehicleColor": vehicleColor,
        "regNo": regNo,
        "date": date.toIso8601String(),
        "__v": v,
    };
}
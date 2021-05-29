// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.email,
    this.password,
        this.personalInformations,
        this.vehicleDetails,
    });

    String email;
  String password;
    PersonalInformations personalInformations;
    VehicleDetails vehicleDetails;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        personalInformations:
            PersonalInformations.fromJson(json["personalInformations"]),
        vehicleDetails: VehicleDetails.fromJson(json["vehicleDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "personalInformations": personalInformations.toJson(),
        "vehicleDetails": vehicleDetails.toJson(),
    };
}

class PersonalInformations {
    PersonalInformations({
        this.name,
        this.age,
        this.phone,
        this.bloodGroup,
        this.address,
    });

    String name;
    String age;
    String phone;
    String bloodGroup;
    Address address;

    factory PersonalInformations.fromJson(Map<String, dynamic> json) =>
      PersonalInformations(
        name: json["name"],
        age: json["age"],
        phone: json["phone"],
        bloodGroup: json["bloodGroup"],
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "phone": phone,
        "bloodGroup": bloodGroup,
        "address": address.toJson(),
    };
}

class Address {
    Address({
        this.houseName,
        this.postOffice,
        this.city,
        this.pincode,
    });

    String houseName;
    String postOffice;
    String city;
    String pincode;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        houseName: json["houseName"],
        postOffice: json["postOffice"],
        city: json["city"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "houseName": houseName,
        "postOffice": postOffice,
        "city": city,
        "pincode": pincode,
    };
}

class VehicleDetails {
    VehicleDetails({
        this.licenceNo,
        this.vehicleModel,
        this.vehicleColor,
        this.regNo,
    });

    String licenceNo;
    String vehicleModel;
    String vehicleColor;
    String regNo;

    factory VehicleDetails.fromJson(Map<String, dynamic> json) => VehicleDetails(
        licenceNo: json["licenceNo"],
        vehicleModel: json["vehicleModel"],
        vehicleColor: json["vehicleColor"],
        regNo: json["regNo"],
    );

    Map<String, dynamic> toJson() => {
        "licenceNo": licenceNo,
        "vehicleModel": vehicleModel,
        "vehicleColor": vehicleColor,
        "regNo": regNo,
    };
}

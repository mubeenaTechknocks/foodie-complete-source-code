import 'dart:convert';

import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<bool> register(UserModel user) async {
  var url =
      Uri.parse(ApiUrls.deliveryBoyRegister);
  // var url =
  //     Uri.parse('https://foodiedeliveryapp.herokuapp.com/api/user/register');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "email": user.email,
      "password": user.password,
      "name": user.personalInformations.name,
      "age": user.personalInformations.age,
      "phone": user.personalInformations.phone,
      "bloodGroup": user.personalInformations.bloodGroup,
      "houseName": user.personalInformations.address.houseName,
      "postOffice": user.personalInformations.address.postOffice,
      "city": user.personalInformations.address.city,
      "pincode": user.personalInformations.address.pincode,
      "licenceNo": user.vehicleDetails.licenceNo,
      "vehicleModel": user.vehicleDetails.vehicleModel,
      "vehicleColor": user.vehicleDetails.vehicleColor,
      "regNo": user.vehicleDetails.regNo
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);

    return true;
  } else {
    print(response.statusCode);
    print(response.body.toString());
    return false;
  }
}

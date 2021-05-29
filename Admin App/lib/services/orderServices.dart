import 'package:foodieadmin/model/ordersModel.dart';
import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<List<OrdersModel>> getOrders() async {
  var url = Uri.parse(ApiUrls.orders);
  // var url = Uri.https("foodiehotel.herokuapp.com", "/orderdetails");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var body = ordersModelFromJson(response.body);
    return body;
  } else {
    throw Exception('failed to load');
  }
}




// Future<bool> updateOrderStatus(String id, String status) async {
//   var url = Uri.https("foodiehotel.herokuapp.com", "/orderdetails/$id");
//   var response = await http.patch(url,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode({
//         "statusdetails":  status
//       }));
//   if (response.statusCode == 200) {
//     return true;
//   } else {
//     return false;
//   }
// }
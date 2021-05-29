import 'package:foodieadmin/model/deliveryboys.dart';
import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<List<Deliveryboys>> getdata() async {
  var url = Uri.parse(ApiUrls.deliveryBoys);
  print(url);
  // var url = Uri.https("foodie-main.herokuapp.com", "delivery/deliveryboy");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var body = deliveryboysFromJson(response.body);
    print(body);
    return body;
  } else {
    print(response.statusCode);
    throw Exception('failed to load');
  }
}

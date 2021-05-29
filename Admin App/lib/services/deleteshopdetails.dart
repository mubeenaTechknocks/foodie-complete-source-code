import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<bool> deleteshopdetails(String id) async {
  bool status = false;
  var url = Uri.parse(ApiUrls.shop + '/$id');
  print(url);
  // var url = Uri.https(
  //     'foodie-main.herokuapp.com', 'admin/hoteldetails/$id', {'q': '{http}'});
  final response = await http.delete(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    status = true;
  } else {
    print(response.statusCode);
    status = false;
  }
  return status;
}

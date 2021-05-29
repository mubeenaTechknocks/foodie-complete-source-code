import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;

Future<bool> deletesubadmindata(String id) async {
  var url = Uri.parse(ApiUrls.subAdmin + '/$id');
  // var url = Uri.https(
  //     'foodie-main.herokuapp.com', 'admin/subadmin/$id', {'q': '{http}'});
  final response = await http.delete(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('failed to load');
  }
}

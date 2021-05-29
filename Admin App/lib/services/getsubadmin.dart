import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:foodieadmin/model/subadminmodels.dart';

Future<List<Subadminals>> getdata() async {
  var url = Uri.parse(ApiUrls.subAdmin);
  // var url = Uri.https("foodie-main.herokuapp.com", "admin/subadmin");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var body = subadminalsFromJson(response.body);
    return body;
  } else {
    throw Exception('failed to load');
  }
}

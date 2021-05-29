import 'package:foodieadmin/services/apiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:foodieadmin/model/shopdetails.dart';

Future<List<Shop>> gethotels() async {
  var url = Uri.parse(ApiUrls.getshop);

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var body = shopFromJson(response.body);
    return body;
  } else {
    throw Exception('failed to load');
  }
}

import 'dart:async';
import 'dart:io';

import 'package:foodieshop/services/apiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<bool> uploadProductImage(String fileaPath, id) async {
  final url = Uri.parse(ApiUrls.uploadImage);

  try {
    var request = http.MultipartRequest('POST', url)
      ..fields['id'] = id
      ..files.add(await http.MultipartFile.fromPath('productImage', fileaPath,
          contentType: MediaType('image', 'jpeg')));
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Uploaded!');
      return true;
    } else {
      print(response.stream.toString());
      print(response.statusCode);
      return false;
    }
  } on SocketException {
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

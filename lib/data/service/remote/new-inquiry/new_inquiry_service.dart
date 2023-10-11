// ignore_for_file: avoid_print

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/new-inquiry/new_inquiry_request.dart';
import '../../../base/base_status_response.dart';
import 'package:http_parser/http_parser.dart';

class NewInquiryService {
  final http.Client httpClient = http.Client();

  Future<http.Response> addInquiry(
    NewInquiryRequest request,
    AuthenticationHeaderRequest header,
  ) async {
    const baseUrl =
        'http://${BaseConfig.BASE_DOMAIN}${BaseConfig.BASE_PATH}${BaseConfig.fetchQuiry}';
    final token = header.accesToken;
// httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    var body = http.MultipartRequest('POST', Uri.parse(baseUrl));
    body.headers['Authorization'] = 'Bearer $token';
    body.headers['Cookie'] = 'token=$token';
    body.headers['Connection'] = 'keep-alive';

    body.fields['service_name'] = request.service_name;
    body.fields['pick_up'] = request.pick_up;
    body.fields['pick_up_time'] = request.pick_up_time;
    body.fields['weight'] = request.weight.toString();
    var imageFile = File(request.image!.path);
    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();
    body.files.add(http.MultipartFile(
      'image',
      imageStream,
      imageLength,
      filename: request.image!.path,
      contentType: MediaType('image', 'jpg'),
    ));

    print("ini url new-inquiry : $baseUrl");

    var response = await body.send();
    return await http.Response.fromStream(response);
  }
}

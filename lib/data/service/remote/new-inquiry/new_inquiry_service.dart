import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/new-inquiry/new_inquiry_request.dart';
import '../../../base/base_status_response.dart';
import 'package:http_parser/http_parser.dart';

class NewInquiryService {
  final Dio dio = Dio();

  addInquiry(
    NewInquiryRequest request,
    AuthenticationHeaderRequest header,
  ) async {
    final baseUrl =
        'http://${BaseConfig.BASE_DOMAIN}${BaseConfig.BASE_PATH}${BaseConfig.fetchQuiry}';
    final token = header.accesToken;

    var formData = FormData.fromMap({
      'service_name': request.service_name,
      'weight': request.weight.toString(),
      'pick_up': request.pick_up,
      'image': MultipartFile.fromBytes(
        request.image!.readAsBytesSync(),
        filename: request.image!.path,
        contentType: MediaType('image', 'jpg'),
      ),
      'pick_up_time': request.pick_up_time,
    });
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
      'Content-Type': 'multipart/form-data',
      'Connection': 'keep-alive',
    };

    print("ini url new-inquiry : $baseUrl");
    return dio.post(baseUrl, data: formData);
  }
}

// class NewInquiryService {
//   Client client = Client();
//   Future<Response> addQuiry(
//       NewInquiryRequest request, AuthenticationHeaderRequest header) async {
//     final url = Uri.http(
//       BaseConfig.BASE_DOMAIN,
//       BaseConfig.BASE_PATH + BaseConfig.fetchQuiry,
//     );

//     var multipartRequest = MultipartRequest('POST', url);
//     print("URL new-inquiry : ${url.toString()}");
//     var body = HashMap<String, String>();

//     multipartRequest.files.add(
//       MultipartFile.fromBytes("image", request.image!.readAsBytesSync(),
//           filename: request.image!.path,
//           contentType: MediaType('image', 'jpg')),
//     );

//     var token = header.accesToken;
//     print("ini header new inquiry : $token");
//     multipartRequest.headers.addAll({
//       'Authorization': 'Bearer $token',
//       'Cookie': 'token=$token',
//       'Content-Type': 'multipart/form-data',
//       'Connection': 'keep-alive'
//     });
//     body["service_name"] = request.service_name;
//     body["weighht"] = request.weight.toString();
//     body["pick_up"] = request.pick_up;
//     body["pick_up_time"] = request.pick_up_time;
//     // multipartRequest.headers.addAll(header.toHeader());
//     multipartRequest.fields.addAll(body);
//     var streamedResponse = await multipartRequest.send();
//     var response = await Response.fromStream(streamedResponse);
//     //return multipartRequest.send();
//     return response;
//   }
// }

// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';

class DetailHistoryRemoteService {
  // final http.Client httpClient = http.Client();
  Client client = Client();
  Future<Response> fecthDetailHistory(
    String date,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.DETAIL_HISTORY,
    );
    print("URL : ${url}");

    final Map<String, dynamic> requestBody = {
      "date": date,
    };
    return client.post(url,
        body: jsonEncode(
            requestBody), // Menggunakan jsonEncode untuk mengubah Map menjadi JSON
        headers: {
          'Content-Type': 'application/json',
        });

    // return client.post(url, body: jsonEncode(date), headers: {
    //   // 'Authorization': 'Bearer $token',
    //   // 'Cookie': 'token=$token',
    //   'Content-Type': 'application/json',
    // });
  }
}

// import 'package:http/http.dart' as http;
// import 'package:loginandsignup/data/base/base_status_response.dart';

// class DetailHistoryRemoteService {
//   final http.Client httpClient = http.Client();

//   Future<http.Response> fecthDetailHistory(String date) async {
//     const baseUrl =
//         'http://${BaseConfig.BASE_DOMAIN}${BaseConfig.BASE_PATH}${BaseConfig.DETAIL_HISTORY}';

//     var body = http.MultipartRequest('POST', Uri.parse(baseUrl));
//     body.headers['Content-Type'] = 'application/json';

//     body.fields['date'] = date;

//     print("${baseUrl}");

//     var response = await body.send();
//     return await http.Response.fromStream(response);
//   }
// }

// ignore_for_file: avoid_print

import 'package:http/http.dart';
import '../../../../domain/base/authentication_header_request.dart';
import '../../../base/base_status_response.dart';

class PointRemoteService {
  Client client = Client();

  Future<Response> fetchPoint(AuthenticationHeaderRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.fetchPoint);

    print("URL : ${url.toString()}");
    var token = header.accesToken;
    print("ini token point service : $token");
    return client.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
      'Content-Type': 'application/json',
    });
  }
}

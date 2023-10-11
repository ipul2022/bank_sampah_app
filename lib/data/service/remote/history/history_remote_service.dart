// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

class HistoryRemoteService {
  Client client = Client();

  Future<Response> fecthHistory(AuthenticationHeaderRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.fetchHistory);
    print("URL : ${url.toString()}");
    var token = header.accesToken;
    print("ini token history riwayat : $token");
    return client.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
      'Content-Type': 'application/json',
    });
  }
}

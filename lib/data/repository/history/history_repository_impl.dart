import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/history/history_collection.dart';
import 'package:loginandsignup/data/service/remote/history/history_remote_service.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/history/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final historyService = HistoryRemoteService();
  @override
  Future<ResultEntity<List>> fecthHistory(
      AuthenticationHeaderRequest header) async {
    
    try {
      final response = await historyService.fecthHistory(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<HistoryCollectionResponse> baseResponseObject =
            BaseRemoteResponse<HistoryCollectionResponse>.fromJson(
                jsonDecode(response.body),
                (json) => HistoryCollectionResponse.fromJson(
                    json as Map<String, dynamic>));
        HistoryCollectionResponse.fromJson(jsonDecode(response.body));
        if (baseResponseObject.status == null) {
          // ignore: avoid_print
          print(baseResponseObject.status);
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 0) {
          // ignore: avoid_print
          print(baseResponseObject.status!.code);
          return ResultError(message: "");
        } else {
          // ignore: avoid_print
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toHomeRiwayatData());
        }
      } else {
        // ignore: avoid_print
        print(response.statusCode);
        return ResultError(message: "");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}

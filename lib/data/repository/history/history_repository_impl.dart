// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/Riwayat/riwayat_response.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/history/history_remote_service.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/home/riwayat_data.dart';
import 'package:loginandsignup/domain/repository/history/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final historyService = HistoryRemoteService();

  @override
  Future<ResultEntity<List<RiwayatData>>> fecthHistory(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await historyService.fecthHistory(header);
      print("STATUS CODE HISTORY : ${response.statusCode}");
      print("DATA HISTORY : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<List<RiwayatCollectionResponse>> baseResponseArray =
            BaseRemoteResponse<List<RiwayatCollectionResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map(
                      (e) => RiwayatCollectionResponse.fromJson(
                          e as Map<String, dynamic>),
                    )
                    .toList());
        if (baseResponseArray.status == null) {
          print(baseResponseArray.status);
          return ResultError(message: baseResponseArray.status!.message);
        } else if (baseResponseArray.status?.code != 1) {
          print(baseResponseArray.status!.code);
          return ResultError(message: baseResponseArray.status!.message);
        } else {
          print(baseResponseArray.data);
          return ResultSuccess<List<RiwayatData>>(
              baseResponseArray.data?.map((e) => e.toRiwayatData()).toList() ??
                  List.empty());
        }
      } else {
        print(response.statusCode);
        return ResultError(message: "");
      }
    } catch (e) {
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}

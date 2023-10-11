// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';

import 'package:loginandsignup/data/model/new_inquiry/new_inquiry_response.dart';
import 'package:loginandsignup/data/service/remote/detail_riwayat/detail_history_remote_service.dart';
import 'package:loginandsignup/domain/model/data/new_inquiry/new_inquiry_data.dart';

import 'package:loginandsignup/domain/repository/detail_history/detail_history_repository.dart';

class DetailHistoryRepositoryImpl implements DetailHistoryRepository {
  final detailHistoryService = DetailHistoryRemoteService();

  @override
  Future<ResultEntity<NewInquiryData>> fecthDetailHistory(String date,) async {
    
    try {
      final response = await detailHistoryService.fecthDetailHistory(date);
      print("STATUS CODE NEW QUIRY: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<NewInquiryResponse> baseResponseObject =
            BaseRemoteResponse<NewInquiryResponse>.fromJson(
                jsonDecode(response.body),
                (json) => NewInquiryResponse.fromJson(
                    json as Map<String, dynamic>));
        if (baseResponseObject.status == null) {
          return ResultError(message: "Status Null");
        } else if (baseResponseObject.status!.code != 1) {
          return ResultError(message: "Status Code Not Null");
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toNewInquiryData());
        }
      } else {
        print('Erroe Impl detail : ${response.toString()}');
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("Error Impl e Detail : ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}

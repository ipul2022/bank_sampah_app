// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/Point_Response/point_response.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/point/point_service.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/Point_sampah/point_data.dart';
import 'package:loginandsignup/domain/repository/point/point_repository.dart';

class PointRespositoryImpl implements PointRepository {
  final pointService = PointRemoteService();

  @override
  Future<ResultEntity<PointData>> fetchPoint(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await pointService.fetchPoint(header);
      print("STATUS CODE POINT :${response.statusCode} ");
      print("DATA POINT :${response.body} ");

      if (response.statusCode == 200 || response.statusCode == 401) {
        BaseRemoteResponse<PointResponse> baseResponseObject =
            BaseRemoteResponse<PointResponse>.fromJson(
          jsonDecode(response.body),
          (json) => PointResponse.fromJson(json as Map<String, dynamic>),
        );
        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
          // return ResultError<PointData>(message: "Error");
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toPointData());
        }
      } else {
        print("Error Impl Point:${response.toString()}");
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("ERROR IMPL Point: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}

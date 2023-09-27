// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/new_inquiry/new_inquiry_response.dart';
import 'package:loginandsignup/data/service/remote/new-inquiry/new_inquiry_service.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/new_inquiry/new_inquiry_data.dart';
import 'package:loginandsignup/domain/model/request/new-inquiry/new_inquiry_request.dart';
import 'package:loginandsignup/domain/repository/new-inquiry/new_inquiry_repository.dart';

class NewInquiryRepositoryImpl implements NewInquiryRepository {
  final newInquiryService = NewInquiryService();

  @override
  Future<ResultEntity<NewInquiryData>> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header) async {
    try {
      final response = await newInquiryService.addInquiry(request, header);
      // var streamedResponse = await multipartRequest.send();
      // var response = await Response.fromStream(streamedResponse);
      print("STATUS CODE NEW QUIRY: ${response.statusCode}");
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<NewInquiryResponse> baseResponseObject =
            BaseRemoteResponse<NewInquiryResponse>.fromJson(
          jsonDecode(response.data),
          (json) => NewInquiryResponse.fromJson(json as Map<String, dynamic>),
        );

        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toNewInquiryData());
        }
      } else {
        print("Error Impl new-inquiry :${response.toString()}");
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("ERROR IMPL e new-inquiry: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}

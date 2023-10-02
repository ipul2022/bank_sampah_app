// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';

import 'package:loginandsignup/data/model/token/token_response.dart';
import 'package:loginandsignup/data/service/remote/cinfirm_code/config_code_remote_service.dart';
import 'package:loginandsignup/domain/base/token_request_header.dart';

import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';
import 'package:loginandsignup/domain/repository/confrim_code/config_code_repository.dart';

class ConfigCodeRepositoryImpl implements ConfigCodeRepository {
  final configCodeService = ConfigCodeRemoteService(email: '');

  @override
  Future<ResultEntity> submitConfirmCode(
      ConfirmCodeRequest request, TokenHeaderRequest email) async {
    try {
      final response = await configCodeService.submitConfigCode(request, email);

      print("STATUS CODE: ${response.statusCode}");
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<TokenResponse> baseResponseObject =
            BaseRemoteResponse.fromJson(jsonDecode(response.body),
                (json) => TokenResponse.fromJson(json as Map<String, dynamic>));

        TokenResponse.fromJson(
          jsonDecode(response.body),
        );

        if (baseResponseObject.status == null) {
          return ResultError();
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
        } else if (baseResponseObject.data == null) {
          return ResultError(message: baseResponseObject.status?.message);
        } else {
          return ResultSuccess(baseResponseObject.data!.toTokenData());
        }
      } else {
        return ResultError(message: response.body);
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}

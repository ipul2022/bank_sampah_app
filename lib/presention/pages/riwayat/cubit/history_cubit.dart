// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/home/riwayat_data.dart';
import 'package:loginandsignup/domain/repository/history/history_repository.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepository repository;
  HistoryCubit(this.repository) : super(const HistoryState());

  Future<void> fecthHistory() async {
    emit(HistoryInLoading());
    final token = await Commons().getUid();
    print('Token History = ${token}');
    final response =
        await repository.fecthHistory(AuthenticationHeaderRequest(token!));

    if (response is ResultSuccess) {
      emit(HistoryInSucces((response as ResultSuccess).data));
    } else {
      emit(HistoryInError(message: (response as ResultError).message));
      print("Error Cubit : ${(response as ResultError).message}");
    }
  }
}

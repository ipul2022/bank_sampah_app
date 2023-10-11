// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/data/new_inquiry/new_inquiry_data.dart';
import 'package:loginandsignup/domain/repository/detail_history/detail_history_repository.dart';
part 'detal_history_state.dart';

class DetalHistoryCubit extends Cubit<DetalHistoryState> {
  DetailHistoryRepository repository;
  DetalHistoryCubit(this.repository) : super(DetalHistoryInitial());

  Future<void> btn(String date) async {
    emit(DetalHistoryIsLoading());
    final response = await repository.fecthDetailHistory(date);
    print(response);
    if (response is ResultSuccess) {
      print("success");
      emit(DetalHistoryIsSuccess((response as ResultSuccess).data));
    } else {
      print("error");
      emit(DetalHistoryIsError(message: (response as ResultError).message));
      print((response).toString());
    }
  }
}

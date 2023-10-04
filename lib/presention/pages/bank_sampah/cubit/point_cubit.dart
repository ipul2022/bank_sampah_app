// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/domain/model/data/Point_sampah/point_data.dart';
import '../../../../data/base/result_entity.dart';
import '../../../../data/utilities/commons.dart';
import '../../../../domain/base/authentication_header_request.dart';
import '../../../../domain/repository/point/point_repository.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  final PointRepository repository;
  PointCubit(this.repository) : super(PointInitial());

  Future<void> fectPoint() async {
    emit(PointIsLoading());
    final token = await Commons().getUid();
    print('Token Home = $token');
    final response =
        await repository.fetchPoint(AuthenticationHeaderRequest(token!));
    if (response is ResultSuccess) {
      emit(PointIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(PointIsError(message: (response as ResultError).message));
      print((response as ResultError).message);
    }
  }
}

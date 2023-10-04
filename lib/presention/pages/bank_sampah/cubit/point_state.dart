// ignore_for_file: must_be_immutable

part of 'point_cubit.dart';

class PointState extends Equatable {
  const PointState();

  @override
  List<Object> get props => [];
}

class PointInitial extends PointState {}

class PointIsLoading extends PointState {}

class PointIsSuccess extends PointState {
  final PointData data;
  const PointIsSuccess({
    required this.data,
  });
}

class PointIsError extends PointState {
  String? message;
  PointIsError({
    this.message,
  });
}

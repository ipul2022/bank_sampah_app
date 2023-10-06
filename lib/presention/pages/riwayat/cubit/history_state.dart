// ignore_for_file: must_be_immutable

part of 'history_cubit.dart';

class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryInLoading extends HistoryState {}

class HistoryInSucces extends HistoryState {
  List<RiwayatData> data;
  HistoryInSucces(
    this.data,
  );
}

class HistoryInError extends HistoryState {
  String? message;
  HistoryInError({
    this.message,
  });
}

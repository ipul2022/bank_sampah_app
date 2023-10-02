// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'penjemputan_event.dart';
part 'penjemputan_state.dart';

class PenjemputanBloc extends Bloc<PenjemputanEvent, PenjemputanState> {
  PenjemputanBloc() : super(PenjemputanInitial()) {
    on<PenjemputanEvent>((event, emit) { 
    });
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'konfirmasi_pembayaran_state.dart';

class KonfirmasiPembayaranCubit extends Cubit<KonfirmasiPembayaranState> {
  KonfirmasiPembayaranCubit() : super(KonfirmasiPembayaranInitial());
}

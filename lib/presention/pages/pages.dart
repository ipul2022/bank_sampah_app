import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loginandsignup/data/repository/config-code/config_code_repository_impl.dart';
import 'package:loginandsignup/data/repository/forgot-password/forgot_password_repository.impl.dart';

import 'package:loginandsignup/data/repository/home/home_repository_impl.dart';
import 'package:loginandsignup/data/repository/login/login_repository_impl.dart';
import 'package:loginandsignup/data/repository/registrasi/registrasi_repository_impl.dart';
import 'package:loginandsignup/data/repository/tukar_point/tukar_point_repository_impl.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/request/Register/register_request.dart';
import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';
import 'package:loginandsignup/domain/model/request/forgot_request/forgot_password.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';
import 'package:loginandsignup/presention/pages/bank_sampah/radiotile.dart';
import 'package:loginandsignup/presention/pages/config_pass/cubit/config_pass_cubit.dart';
import 'package:loginandsignup/presention/pages/detail_riwayat/cubit/detal_history_cubit.dart';
import 'package:loginandsignup/presention/pages/home/cubit/home_cubit.dart';
import 'package:loginandsignup/presention/pages/login/cubit/login_cubit.dart';

import 'package:loginandsignup/presention/pages/lupa_password/cubit/forgot_pass_cubit.dart';
import 'package:loginandsignup/presention/pages/registrasi/cubit/registrasi_cubit.dart';

import 'package:loginandsignup/presention/pages/tukar_poin/cubit/tukarpoint_cubit.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../model/costum_shapes.dart';
import 'package:readmore/readmore.dart';
import 'dart:async';

part 'home/home_page.dart';
part 'login/login_screen.dart';
part 'autentikasi/autentikasi.dart';
part 'registrasi/registrasi.dart';
part 'layanan/layanan_screen.dart';
part 'config_pass/config_pass_screen.dart';
part 'success_password/success_pass_screen.dart';
part 'lupa_password/lupa_password.dart';
part 'bank_sampah/bank_sampah_screen.dart';
part 'bank_sampah/bank_sampah_penjemputan.dart';
part 'bank_sampah/success_penjemputan_screen.dart';
part 'penjemputan/penjemputan_screen.dart';
part 'tukar_poin/tukar_poin1.dart';
part 'success_auntentikasi/succes_screen.dart';
part 'splash_screen/splash_screen.dart';
part 'navigasibar.dart';
part 'detail_riwayat/detail_riawayat_screen.dart';
part 'riwayat/riwayat_screen.dart';
part 'article/article_screen.dart';
part 'detail_article/detail_article.dart';
part 'profile/profile_change_screen.dart';
part 'profile/profile_screen.dart';
part 'pembayaran/pilih_pembayaran_screen.dart';
part 'pembayaran/konfirmasi_pembayaran_screen.dart';

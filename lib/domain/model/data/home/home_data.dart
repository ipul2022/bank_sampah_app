// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loginandsignup/domain/model/data/home/home_profile_data.dart';
import 'package:loginandsignup/domain/model/data/home/riwayat_data.dart';

class HomeData {
  HomeProfileData profile;
  List<RiwayatData> riwayat;
  HomeData(
    this.profile,
    this.riwayat,
  );
}

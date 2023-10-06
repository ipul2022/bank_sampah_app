import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/home/riwayat_data.dart';

abstract class HistoryRepository {
  Future<ResultEntity<List<RiwayatData>>> fecthHistory(AuthenticationHeaderRequest header);
}

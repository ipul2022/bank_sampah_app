import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/data/new_inquiry/new_inquiry_data.dart';

abstract class DetailHistoryRepository {
  Future<ResultEntity<NewInquiryData>> fecthDetailHistory(String date);
}

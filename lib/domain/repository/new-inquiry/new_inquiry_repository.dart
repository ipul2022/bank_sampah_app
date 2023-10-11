import 'package:loginandsignup/domain/model/data/new_inquiry/new_inquiry_data.dart';

import '../../../data/base/result_entity.dart';
import '../../base/authentication_header_request.dart';
import '../../model/request/new-inquiry/new_inquiry_request.dart';

abstract class NewInquiryRepository {
  Future<ResultEntity<NewInquiryData>> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header);
}

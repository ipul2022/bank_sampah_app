import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/Point_sampah/point_data.dart';



abstract class PointRepository {
  Future<ResultEntity<PointData>> fetchPoint(
      AuthenticationHeaderRequest header);
}

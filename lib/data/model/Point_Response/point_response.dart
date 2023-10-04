// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/Point_sampah/point_data.dart';

part 'point_response.g.dart';

abstract class PointResponseMapper {
  PointData toPointData();
}

@JsonSerializable()
class PointResponse implements PointResponseMapper {
  int? point;

  PointResponse({
    this.point,
  });
  factory PointResponse.fromJson(Map<String, dynamic> json) =>
      _$PointResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PointResponseToJson(this);
  @override
  PointData toPointData() {
    return PointData(point ?? 0);
  }
}

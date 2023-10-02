// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/home/riwayat_data.dart';

part 'riwayat_response.g.dart';

abstract class RiwayatCollectionResponseMapper {
  RiwayatData toRiwayatData();
}

@JsonSerializable()
class RiwayatCollectionResponse implements RiwayatCollectionResponseMapper {
  String? date;
  int? weight;
  int? revenue;
  int? point;
  RiwayatCollectionResponse(
    this.date,
    this.weight,
    this.revenue,
    this.point,
  );

  factory RiwayatCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$RiwayatCollectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RiwayatCollectionResponseToJson(this);

  @override
  RiwayatData toRiwayatData() {
    return RiwayatData(date ?? "", weight ?? 0, revenue ?? 0, point ?? 0);
  }
}

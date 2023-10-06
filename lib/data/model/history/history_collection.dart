// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:loginandsignup/data/model/Riwayat/riwayat_response.dart';
import 'package:loginandsignup/domain/model/data/home/riwayat_data.dart';

part 'history_collection.g.dart';

abstract class HistoryCollectionResponseMapper {
  List<RiwayatData> toHomeRiwayatData();
}

@JsonSerializable()
class HistoryCollectionResponse implements HistoryCollectionResponseMapper {
  List<RiwayatCollectionResponse>? history;
  HistoryCollectionResponse({
    this.history,
  });

  factory HistoryCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCollectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryCollectionResponseToJson(this);

  @override
  List<RiwayatData> toHomeRiwayatData() {
    return history!.map((e) => e.toRiwayatData()).toList();
  }
}

import 'package:json_annotation/json_annotation.dart';
part 'detail_history_requets.g.dart';

@JsonSerializable()
class DetailRequest {
  String date;
  DetailRequest(
    this.date,
  );

  factory DetailRequest.fromJson(Map<String, dynamic> json) =>
      _$DetailRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$DetailRequestToJson(this);
  }
}

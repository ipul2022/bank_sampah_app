// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/new_inquiry/new_inquiry_data.dart';
part 'new_inquiry_response.g.dart';

abstract class NewInquiryMapper {
  NewInquiryData toNewInquiryData();
}

@JsonSerializable()
class NewInquiryResponse implements NewInquiryMapper {
  String? pickup_address;
  String? date;
  int? price;
  int? weight;
  String? image;
  NewInquiryResponse({
    this.pickup_address,
    this.date,
    this.price,
    this.weight,
    this.image,
  });

  factory NewInquiryResponse.fromJson(Map<String, dynamic> json) =>
      _$NewInquiryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewInquiryResponseToJson(this);
  @override
  NewInquiryData toNewInquiryData() {
    return NewInquiryData(
        pickup_address ?? "", date ?? "", price ?? 0, weight ?? 0, image ?? "");
  }
}

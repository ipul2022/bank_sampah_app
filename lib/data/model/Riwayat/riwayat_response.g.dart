// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiwayatCollectionResponse _$RiwayatCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    RiwayatCollectionResponse(
      json['date'] as String?,
      json['weight'] as int?,
      json['revenue'] as int?,
      json['point'] as int?,
    );

Map<String, dynamic> _$RiwayatCollectionResponseToJson(
        RiwayatCollectionResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'weight': instance.weight,
      'revenue': instance.revenue,
      'point': instance.point,
    };

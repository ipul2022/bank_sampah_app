// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiwayatCollectionResponse _$RiwayatCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    RiwayatCollectionResponse(
      date: json['date'] as String?,
      weight: json['weight'] as int?,
      revenue: json['revenue'] as int?,
      point: json['point'] as int?,
    );

Map<String, dynamic> _$RiwayatCollectionResponseToJson(
        RiwayatCollectionResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'weight': instance.weight,
      'revenue': instance.revenue,
      'point': instance.point,
    };

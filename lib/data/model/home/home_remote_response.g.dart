// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRemoteResponse _$HomeRemoteResponseFromJson(Map<String, dynamic> json) =>
    HomeRemoteResponse(
      profile: json['profile'] == null
          ? null
          : HomeProfileResponse.fromJson(
              json['profile'] as Map<String, dynamic>),
      riwayat: (json['riwayat'] as List<dynamic>?)
          ?.map((e) =>
              RiwayatCollectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeRemoteResponseToJson(HomeRemoteResponse instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'riwayat': instance.riwayat,
    };

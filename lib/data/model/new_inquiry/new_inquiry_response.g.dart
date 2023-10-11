// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_inquiry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewInquiryResponse _$NewInquiryResponseFromJson(Map<String, dynamic> json) =>
    NewInquiryResponse(
      pickup_address: json['pickup_address'] as String?,
      date: json['date'] as String?,
      price: json['price'] as int?,
      weight: json['weight'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NewInquiryResponseToJson(NewInquiryResponse instance) =>
    <String, dynamic>{
      'pickup_address': instance.pickup_address,
      'date': instance.date,
      'price': instance.price,
      'weight': instance.weight,
      'image': instance.image,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscountModel _$DiscountModelFromJson(Map<String, dynamic> json) =>
    DiscountModel(
      imageUrl: json['image_url'] as String,
      openType: json['open_type'] as String,
      link: json['link'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$DiscountModelToJson(DiscountModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'open_type': instance.openType,
      'link': instance.link,
      'id': instance.id,
    };

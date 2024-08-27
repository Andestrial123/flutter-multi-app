// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarksModel _$MarksModelFromJson(Map<String, dynamic> json) => MarksModel(
      id: json['id'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      bakeryHours: json['bakeryHours'] == null
          ? null
          : BakeryHours.fromJson(json['bakeryHours'] as Map<String, dynamic>),
      deliveryHours: json['deliveryHours'] == null
          ? null
          : DeliveryHours.fromJson(
              json['deliveryHours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarksModelToJson(MarksModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'bakeryHours': instance.bakeryHours,
      'deliveryHours': instance.deliveryHours,
    };

DeliveryHours _$DeliveryHoursFromJson(Map<String, dynamic> json) =>
    DeliveryHours(
      openAt: _fromJson(json['openAt'] as String?),
      closeAt: _fromJson(json['closeAt'] as String?),
      isOpen: json['isOpen'] as bool?,
    );

Map<String, dynamic> _$DeliveryHoursToJson(DeliveryHours instance) =>
    <String, dynamic>{
      'openAt': _toJson(instance.openAt),
      'closeAt': _toJson(instance.closeAt),
      'isOpen': instance.isOpen,
    };

BakeryHours _$BakeryHoursFromJson(Map<String, dynamic> json) => BakeryHours(
      openAt: _fromJson(json['openAt'] as String?),
      closeAt: _fromJson(json['closeAt'] as String?),
      isOpen: json['isOpen'] as bool?,
    );

Map<String, dynamic> _$BakeryHoursToJson(BakeryHours instance) =>
    <String, dynamic>{
      'openAt': _toJson(instance.openAt),
      'closeAt': _toJson(instance.closeAt),
      'isOpen': instance.isOpen,
    };

import 'package:json_annotation/json_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

part 'marks_model.g.dart';

@JsonSerializable()
class MarksModel {
  MarksModel({
    this.id,
    this.address,
    this.latitude,
    this.longitude,
    this.bakeryHours,
    this.deliveryHours,
  });

  final String? id;
  final String? address;
  final double? latitude;
  final double? longitude;
  final BakeryHours? bakeryHours;
  final DeliveryHours? deliveryHours;

  factory MarksModel.fromJson(Map<String, dynamic> json) => _$MarksModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarksModelToJson(this);
}

@JsonSerializable()
class DeliveryHours {
  DeliveryHours({
    this.openAt,
    this.closeAt,
    this.isOpen,
  });

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final tz.TZDateTime? openAt;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final tz.TZDateTime? closeAt;

  final bool? isOpen;

  factory DeliveryHours.fromJson(Map<String, dynamic> json) => _$DeliveryHoursFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryHoursToJson(this);
}

@JsonSerializable()
class BakeryHours {
  BakeryHours({
    this.openAt,
    this.closeAt,
    this.isOpen,
  });

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final tz.TZDateTime? openAt;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final tz.TZDateTime? closeAt;

  final bool? isOpen;

  factory BakeryHours.fromJson(Map<String, dynamic> json) => _$BakeryHoursFromJson(json);

  Map<String, dynamic> toJson() => _$BakeryHoursToJson(this);
}


tz.TZDateTime? _fromJson(String? date) {
  if (date == null) return null;
  final location = tz.getLocation('Europe/Kyiv');
  return tz.TZDateTime.parse(location, date);
}

String? _toJson(tz.TZDateTime? date) {
  return date?.toIso8601String();
}

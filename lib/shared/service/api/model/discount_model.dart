import 'package:json_annotation/json_annotation.dart';

part 'discount_model.g.dart';

@JsonSerializable()
class DiscountModel {
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'open_type')
  final String openType;

  final String link;
  final String id;

  DiscountModel({
    required this.imageUrl,
    required this.openType,
    required this.link,
    required this.id,
  });

  // Generated method for deserializing JSON to DiscountModel
  factory DiscountModel.fromJson(Map<String, dynamic> json) => _$DiscountModelFromJson(json);

  // Generated method for serializing DiscountModel to JSON
  Map<String, dynamic> toJson() => _$DiscountModelToJson(this);
}

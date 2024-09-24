import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  final String name;
  final String imageUrl;
  final String id;

  IngredientModel({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    this.name,
    this.id,
    this.initial,
  });

  final String? name;
  final String? id;
  final bool? initial;

  factory CategoryModel.fromJson(dynamic json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

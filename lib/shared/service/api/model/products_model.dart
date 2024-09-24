import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';
import 'ingredient_model.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  final String name;
  final String description;
  final String categoryId;
  final String imageUrl;
  final String unit;
  final double price;
  final int calories;
  final int quantity;
  final String id;
  final CategoryModel category;
  final List<IngredientModel> ingredients;

  ProductsModel({
    required this.name,
    required this.description,
    required this.categoryId,
    required this.imageUrl,
    required this.unit,
    required this.price,
    required this.calories,
    required this.quantity,
    required this.id,
    required this.category,
    required this.ingredients,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}


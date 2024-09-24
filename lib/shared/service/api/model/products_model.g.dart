// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      name: json['name'] as String,
      description: json['description'] as String,
      categoryId: json['categoryId'] as String,
      imageUrl: json['imageUrl'] as String,
      unit: json['unit'] as String,
      price: (json['price'] as num).toDouble(),
      calories: (json['calories'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      id: json['id'] as String,
      category: CategoryModel.fromJson(json['category']),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'imageUrl': instance.imageUrl,
      'unit': instance.unit,
      'price': instance.price,
      'calories': instance.calories,
      'quantity': instance.quantity,
      'id': instance.id,
      'category': instance.category,
      'ingredients': instance.ingredients,
    };

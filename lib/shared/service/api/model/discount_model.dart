import 'package:json_annotation/json_annotation.dart';

part 'discount_model.g.dart';

@JsonSerializable()
class DiscountModel {
  final String? imageUrl;
  final String? link;
  final String? id;

  DiscountModel({this.imageUrl, this.link, this.id});

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      imageUrl: json['image_url'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );
  }
}

List<DiscountModel> parseDiscounts(List<dynamic> jsonList) {
  return jsonList.map((json) => DiscountModel.fromJson(json)).toList();
}

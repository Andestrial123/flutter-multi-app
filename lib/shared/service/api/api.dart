import 'package:dio/dio.dart';
import 'package:flutter_multi_app/features/google_maps/data/marks_model.dart';
import 'package:flutter_multi_app/shared/service/api/model/discount_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'model/category_model.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://flutter-multi-app-server-c914b012a757.herokuapp.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/multi/v1/categories')
  Future<List<CategoryModel>> getCategories();

  @GET('/multi/v1/categories/{category_id}')
  Future<CategoryModel> getCategoriesById(
    @Path('category_id') categoryId,
  );

  @GET('/multi/v1/discounts')
  Future<List<DiscountModel>> getDiscounts();

  @GET('/multi/v1/discount/{discount_id}')
  Future<DiscountModel> getDiscountsById(
    @Path('discount_id') discountId,
  );

  @GET('/multi/v1/marks')
  Future<List<MarksModel>> getMarks(@Query('timezone') String timezone);
}

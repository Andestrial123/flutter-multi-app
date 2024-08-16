import 'package:dio/dio.dart';
import 'package:flutter_multi_app/features/google_maps/data/marks_model.dart';
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

  @GET('/multi/v1/marks')
  Future<List<MarksModel>> getMarks(@Query('timezone') String timezone);

  @GET('/multi/v1/mark/{mark_id}')
  Future<List<MarksModel>> getMarkId(
      @Path('mark_id') String markId,
      @Query('timezone') String timezone,
      );
}

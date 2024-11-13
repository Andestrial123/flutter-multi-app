import 'package:dio/dio.dart';
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
}

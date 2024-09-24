import 'package:dio/dio.dart';
import 'package:flutter_multi_app/shared/service/api/model/discount_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'model/category_model.dart';
import 'model/products_model.dart';

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

  @GET('/multi/v1/products')
  Future<List<ProductsModel>> getProducts(
    @Query('category_id') categoryId,
  );

  @GET('/multi/v1/products/{product_id}')
  Future<ProductsModel> getProductsById(
    @Path('product_id') productId,
  );

  @GET('/multi/v1/discounts')
  Future<List<DiscountModel>> getDiscounts();

  @GET('/multi/v1/discount/{discount_id}')
  Future<DiscountModel> getDiscountById(
    @Path('discount_id') discountId,
  );
}

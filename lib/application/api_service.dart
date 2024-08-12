import 'package:dio/src/response.dart';
import 'package:flutter_multi_app/application/dio_client.dart';
import 'package:flutter_multi_app/shared/assets/endpoints.dart';

class ApiService{
  static Future<Response> health() async => await DioClient().get(Endpoints.health);
}
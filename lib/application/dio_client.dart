import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://flutter-multi-app-server-c914b012a757.herokuapp.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ) {
    _dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      logPrint: (object) {
        print(object);
      },
    ));
  }

  Dio get dio => _dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode}, ${e.message}');
      throw e;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode}, ${e.message}');
      throw e;
    }
  }
}

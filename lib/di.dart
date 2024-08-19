import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/shared/interseptors/auth_interseptor.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:flutter_multi_app/utils/app_route.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final g = GetIt.asNewInstance();

Future<void> setup() async {
  g
    ..registerSingleton<SharedPreferences>(await _getStorage())
    ..registerSingleton<ApiClient>(ApiClient(_getDio()))..registerSingleton(AppRouter());
  _setupBloC();
}

_setupBloC() {
  g.registerSingleton<AuthBloc>(AuthBloc(FirebaseAuth.instance, g.get()));
}

Dio _getDio() {
  final dio = Dio();

  dio.interceptors.addAll([
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
    ),
    AuthInterceptor()
  ]);

  return dio;
}

Future<SharedPreferences> _getStorage() async =>
    SharedPreferences.getInstance();

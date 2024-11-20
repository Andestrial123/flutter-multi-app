import 'package:dio/dio.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/home/domain/home_bloc.dart';
import 'package:flutter_multi_app/firebase_service.dart';
import 'package:flutter_multi_app/routing/app_route.dart';
import 'package:flutter_multi_app/features/google_maps/domain/google_maps_bloc.dart';
import 'package:flutter_multi_app/shared/interseptors/auth_interseptor.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final g = GetIt.asNewInstance();

Future<void> setup() async {
  g
    ..registerSingleton<SharedPreferences>(await _getStorage())
    ..registerSingleton<ApiClient>(ApiClient(_getDio()))
    ..registerSingleton(AppRouter())
    ..registerSingleton(FirebaseService());
  _setupBloC();
}

_setupBloC() {
  g.registerSingleton<AuthBloc>(AuthBloc(g.get(), g.get()));
  g.registerSingleton<GoogleMapsBloc>(GoogleMapsBloc(g.get<ApiClient>()));
  g.registerSingleton<HomeBloc>(HomeBloc(g.get(), g.get()));
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

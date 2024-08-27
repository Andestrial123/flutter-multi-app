import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_app/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_keys.dart';

class AuthInterceptor extends Interceptor {
  final storage = g.get<SharedPreferences>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final getToken = await token;

    if (getToken != null) {
      Clipboard.setData(ClipboardData(text: getToken));
    }

    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${await token}',
      HttpHeaders.acceptLanguageHeader: Platform.localeName
    };

    options.headers.addAll(headers);

    return handler.next(options);
  }

  Future<String?> get token async {
    final oldToken = storage.getString(kToken);
    return oldToken;
  }
}

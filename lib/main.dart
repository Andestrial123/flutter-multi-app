import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/app.dart';
import 'package:flutter_multi_app/di.dart';
import 'package:flutter_multi_app/firebase_options.dart';
import 'package:flutter_multi_app/notification_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///In this file will be all configuration setup that we need before starting app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  await NotificationService.initNotification();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  log("FCMToken $fcmToken");
  await FirebaseMessaging.instance.getInitialMessage();
  await FirebaseMessaging.instance.requestPermission();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();


  await setup();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: MyApp()));
}

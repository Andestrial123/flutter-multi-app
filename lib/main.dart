import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/app.dart';
import 'package:flutter_multi_app/di.dart';
import 'package:flutter_multi_app/firebase_options.dart';
import 'package:flutter_multi_app/generated/codegen_loader.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timezone/data/latest.dart' as tz;

///In this file will be all configuration setup that we need before starting app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  tz.initializeTimeZones();

  await setup();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('uk', 'UA')],
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      child: const MyApp()));
}

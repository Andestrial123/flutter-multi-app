import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/get_started/get_started_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const GetStartedView()),
    );
  }
}

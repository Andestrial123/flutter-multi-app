import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/firebase_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/get_started/get_started_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

///TODO remove GlobalKey
final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    ///TODO rewrite to bloc logic
    FirebaseService().onListenUser((user) {
      if (user == null) {
        kNavigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => const AuthScreen()),
        );
      } else {
        kNavigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => MainScreen(user: user)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (_) => AuthBloc(),
        child: MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: kNavigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const GetStartedView()),
      ),
    );
  }
}

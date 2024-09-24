import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/shared/assets/routes.dart';
import 'package:flutter_multi_app/utils/app_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/di.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/sign_up/domain/sign_up_bloc.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initDynamicLinks();
  }

  void _initDynamicLinks() async {
    FirebaseDynamicLinksPlatform.instance.onLink.listen((dynamicLinkData) {
      final Uri deepLink = dynamicLinkData.link;
      _handleDeepLink(deepLink);
    }).onError((error) {
      print('Error get dynamic link: $error');
    });

    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinksPlatform.instance.getInitialLink();
    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      _handleDeepLink(deepLink);
    }
  }

  void _handleDeepLink(Uri deepLink) {
    print('Received deep link: $deepLink');
    try {
      final String? textParam = deepLink.queryParameters['text'];
      if (deepLink.path == '/${Routes.home}' && textParam != null) {
        _appRouter.push(HomeRoute(text: textParam));
      } else {
        throw Exception('Invalid path or missing text parameter');
      }
    } catch (error) {
      print('Error occurred: ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${error.toString()}')),
      );
    }
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: g.get<AuthBloc>()..add(AuthInitialEvent()),
          ),
          BlocProvider(
            create: (context) => SignUpBloc(),
          ),
        ],
        child: MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: _appRouter.config()),
      ),
    );
  }
}

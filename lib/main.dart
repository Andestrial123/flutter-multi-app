import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/firebase_options.dart';
import 'package:flutter_multi_app/firebase_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///In this file will be all configuration setup that we need before starting app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: const MyApp()));
}
///TODO remove GlobalKey
final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

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
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: kNavigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/di.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/get_started/get_started_view.dart';
import 'package:flutter_multi_app/features/google_maps/domain/google_maps_bloc.dart';
import 'package:flutter_multi_app/features/main/presentation/main_screen.dart';
import 'package:flutter_multi_app/features/sign_up/domain/sign_up_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          BlocProvider.value(value: g.get<GoogleMapsBloc>()..add(FetchMarks()))
        ],
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

            ///TODO remove this after auto router appearing
            home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is AuthLoadedState) {
                return MainScreen(user: FirebaseAuth.instance.currentUser!);
              } else {
                return const GetStartedView();
              }
            })),
      ),
    );
  }
}

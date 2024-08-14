import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart';
import 'package:flutter_multi_app/features/get_started/get_started_view.dart';
import '../../bottom_nav/view/bottom_nav_view.dart';
import '../domain/route_cubit.dart';

@RoutePage()
class RouteStartView extends StatefulWidget {
  const RouteStartView({super.key});

  @override
  State<RouteStartView> createState() => _RouteStartViewState();
}

class _RouteStartViewState extends State<RouteStartView> {
  @override
  void initState() {
    super.initState();
    context.read<RouteCubit>().checkAuthentication();
    print("Initializing RouteStartView");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteCubit, RouteState>(
      builder: (context, state) {
        if (state is RouteMain) {
          print('I am on RouteMain');
            return const BottomNavView();
        } else if (state is RouteAuth) {
          print('I am on RouteAuth');
          return const AuthScreen();
        } else {
          print('Get started?');
          return const GetStartedView();
        }
      },
    );
  }
}

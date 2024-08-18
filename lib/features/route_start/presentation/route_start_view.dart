import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/auth/domain/auth_bloc.dart';
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart';

import '../../bottom_nav/view/bottom_nav_view.dart';

@RoutePage()
class RouteStartView extends StatelessWidget {
  const RouteStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoadedState) {
          return const BottomNavView();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart'
    as _i1;
import 'package:flutter_multi_app/features/bottom_nav/view/bottom_nav_view.dart'
    as _i2;
import 'package:flutter_multi_app/features/get_started/get_started_view.dart'
    as _i3;
import 'package:flutter_multi_app/features/google_maps/presentation/google_maps_screen.dart'
    as _i4;
import 'package:flutter_multi_app/features/home/home_view.dart' as _i5;
import 'package:flutter_multi_app/features/order/order_view.dart' as _i6;
import 'package:flutter_multi_app/features/profile/profile_view.dart' as _i7;
import 'package:flutter_multi_app/features/route_start/presentation/route_start_view.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    BottomNavRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavView(),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GetStartedView(),
      );
    },
    GoogleMapsRoute.name: (routeData) {
      final args = routeData.argsAs<GoogleMapsRouteArgs>(
          orElse: () => const GoogleMapsRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.GoogleMapsScreen(
          key: args.key,
          onToggleBottomNav: args.onToggleBottomNav,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OrderView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileView(),
      );
    },
    RouteStartRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RouteStartView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavView]
class BottomNavRoute extends _i9.PageRouteInfo<void> {
  const BottomNavRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BottomNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GetStartedView]
class GetStartedRoute extends _i9.PageRouteInfo<void> {
  const GetStartedRoute({List<_i9.PageRouteInfo>? children})
      : super(
          GetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GoogleMapsScreen]
class GoogleMapsRoute extends _i9.PageRouteInfo<GoogleMapsRouteArgs> {
  GoogleMapsRoute({
    _i10.Key? key,
    void Function(bool)? onToggleBottomNav,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          GoogleMapsRoute.name,
          args: GoogleMapsRouteArgs(
            key: key,
            onToggleBottomNav: onToggleBottomNav,
          ),
          initialChildren: children,
        );

  static const String name = 'GoogleMapsRoute';

  static const _i9.PageInfo<GoogleMapsRouteArgs> page =
      _i9.PageInfo<GoogleMapsRouteArgs>(name);
}

class GoogleMapsRouteArgs {
  const GoogleMapsRouteArgs({
    this.key,
    this.onToggleBottomNav,
  });

  final _i10.Key? key;

  final void Function(bool)? onToggleBottomNav;

  @override
  String toString() {
    return 'GoogleMapsRouteArgs{key: $key, onToggleBottomNav: $onToggleBottomNav}';
  }
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OrderView]
class OrderRoute extends _i9.PageRouteInfo<void> {
  const OrderRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfileView]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RouteStartView]
class RouteStartRoute extends _i9.PageRouteInfo<void> {
  const RouteStartRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RouteStartRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteStartRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

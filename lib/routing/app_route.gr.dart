// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart'
    as _i1;
import 'package:flutter_multi_app/features/bottom_nav/view/bottom_nav_view.dart'
    as _i2;
import 'package:flutter_multi_app/features/finish_screen/finish_screen.dart'
    as _i3;
import 'package:flutter_multi_app/features/get_started/get_started_view.dart'
    as _i4;
import 'package:flutter_multi_app/features/home/home_view.dart' as _i5;
import 'package:flutter_multi_app/features/location/location_view.dart' as _i6;
import 'package:flutter_multi_app/features/order/order_view.dart' as _i7;
import 'package:flutter_multi_app/features/profile/profile_view.dart' as _i8;
import 'package:flutter_multi_app/features/route_start/presentation/route_start_view.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    BottomNavRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavView(),
      );
    },
    FinishRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FinishScreen(),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.GetStartedView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LocationView(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OrderView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
      );
    },
    RouteStartRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RouteStartView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavView]
class BottomNavRoute extends _i10.PageRouteInfo<void> {
  const BottomNavRoute({List<_i10.PageRouteInfo>? children})
      : super(
          BottomNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FinishScreen]
class FinishRoute extends _i10.PageRouteInfo<void> {
  const FinishRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FinishRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinishRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GetStartedView]
class GetStartedRoute extends _i10.PageRouteInfo<void> {
  const GetStartedRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LocationView]
class LocationRoute extends _i10.PageRouteInfo<void> {
  const LocationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OrderView]
class OrderRoute extends _i10.PageRouteInfo<void> {
  const OrderRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RouteStartView]
class RouteStartRoute extends _i10.PageRouteInfo<void> {
  const RouteStartRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RouteStartRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteStartRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

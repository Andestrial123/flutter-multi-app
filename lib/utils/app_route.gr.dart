// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter_multi_app/features/auth/presentation/auth_screen.dart'
    as _i1;
import 'package:flutter_multi_app/features/bottom_nav/view/bottom_nav_view.dart'
    as _i2;
import 'package:flutter_multi_app/features/get_started/get_started_view.dart'
    as _i3;
import 'package:flutter_multi_app/features/home/home_bakery_view.dart' as _i4;
import 'package:flutter_multi_app/features/location/location_view.dart' as _i5;
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
    HomeBakeryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeBakeryView(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LocationView(),
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
/// [_i4.HomeBakeryView]
class HomeBakeryRoute extends _i9.PageRouteInfo<void> {
  const HomeBakeryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeBakeryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeBakeryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LocationView]
class LocationRoute extends _i9.PageRouteInfo<void> {
  const LocationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

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

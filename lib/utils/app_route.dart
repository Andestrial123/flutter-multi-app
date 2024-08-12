import 'package:auto_route/auto_route.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
   AutoRoute(page: GetStartedView.page,initial: true),
   AutoRoute(page: BottomNavView.page,path: '/bottom_nav',children: [
     AutoRoute(page: HomeView.page,path: 'home'),
     AutoRoute(page: LocationView.page,path: 'location'),
     AutoRoute(page: OrderView.page,path: 'order'),
     AutoRoute(page: MainRoute.page,path: 'profile'),
   ]),
    AutoRoute(page: AuthRoute.page,path: '/auth')
  ];
}
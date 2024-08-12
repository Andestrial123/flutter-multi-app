import 'package:auto_route/auto_route.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
   AutoRoute(page: GetStartedView.page,initial: true),
   AutoRoute(page: BottomNavView.page,path: Routes.bottomNav,children: [
     AutoRoute(page: HomeView.page,path: Routes.home),
     AutoRoute(page: LocationView.page,path: Routes.location),
     AutoRoute(page: OrderView.page,path: Routes.order),
     AutoRoute(page: MainRoute.page,path: Routes.profile),
   ]),
    AutoRoute(page: AuthRoute.page,path: Routes.auth)
  ];
}
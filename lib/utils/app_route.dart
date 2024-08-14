import 'package:auto_route/auto_route.dart';

import '../shared/assets/routes.dart';
import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: RouteStartRoute.page,
            initial: true,
            path: Routes.route,
            children: [
              AutoRoute(
                page: GetStartedRoute.page,
                path: Routes.getStarted,
              ),
              AutoRoute(
                page: AuthRoute.page,
                path: Routes.auth,
              ),
              AutoRoute(
                page: BottomNavRoute.page,
                path: Routes.bottomNav,
              ),
              AutoRoute(page: HomeRoute.page, path: Routes.home),
              AutoRoute(page: LocationRoute.page, path: Routes.location),
              AutoRoute(page: OrderRoute.page, path: Routes.order),
              AutoRoute(page: ProfileRoute.page, path: Routes.profile),
            ]),
      ];
}

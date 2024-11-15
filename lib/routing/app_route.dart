import 'package:auto_route/auto_route.dart';
import 'package:flutter_multi_app/routing/auth_guard.dart';

import 'routes.dart';
import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View|Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppRoute.page, path: '/', children: [
          AutoRoute(
              page: BottomNavRoute.page,
              path: Routes.main,
              initial: true,
              guards: [
                AuthGuard()
              ],
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  path: Routes.home,
                ),
                AutoRoute(page: GoogleMapsRoute.page, path: Routes.location),
                AutoRoute(page: OrderRoute.page, path: Routes.order),
                AutoRoute(page: ProfileRoute.page, path: Routes.profile),
              ]),
          AutoRoute(page: FinishRoute.page, path: Routes.finishScreen),
          AutoRoute(
            page: GetStartedRoute.page,
            path: Routes.getStarted,
          ),
          AutoRoute(
            page: AuthRoute.page,
            path: Routes.auth,
          ),
        ])
      ];
}

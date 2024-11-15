import 'package:auto_route/auto_route.dart';
import 'package:flutter_multi_app/di.dart';
import 'package:flutter_multi_app/firebase_service.dart';
import 'package:flutter_multi_app/routing/app_route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final FirebaseService firebaseAuthService = g.get();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (firebaseAuthService.currentUser != null) {
      resolver.next(true);
    } else {
      resolver.redirect(const AuthRoute());
    }
  }
}

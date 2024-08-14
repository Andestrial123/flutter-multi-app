import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteInitial());

  void navigateToMain() {
    emit(RouteMain());
  }

  void navigateToAuth() {
    emit(RouteAuth());
  }

  void checkAuthentication() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      navigateToMain();
      print('Emit RouteMain');
    } else {
      navigateToAuth();
      print('Emit RouteAuth');
    }
  }
}

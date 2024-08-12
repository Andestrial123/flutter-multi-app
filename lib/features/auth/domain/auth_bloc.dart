import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<GoogleEvent>(_handleGoogleSignIn);
    on<FacebookEvent>(_logInWithFacebook);
    on<ShowSignUpScreenEvent>((event, emit) {
      emit(SignUpScreenState());
    });
    on<ShowAuthScreenEvent>((event, emit) {
      emit(AuthScreenState());
    });
    on<ListenUserEvent>(_listenUserChanges);
  }

  Future<void> _listenUserChanges(
      ListenUserEvent event, Emitter<AuthState> emit) async {

    emit(AuthLoadingState());

    try {
      await for (var user in auth.userChanges()) {
        if (user != null) {
          return emit(AuthLoadedState());
        } else {
          return emit(AuthScreenState());
        }
      }
    } catch (e) {
      return emit(AuthErrorState(e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthLoadedState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState(LocaleKeys.noUserFoundEmail.tr()));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState(LocaleKeys.wrongPasswordProvided.tr()));
      } else {
        emit(AuthErrorState(LocaleKeys.unexpectedOccurred.tr()));
      }
    }
  }

  Future<void> _handleGoogleSignIn(
      GoogleEvent event, Emitter<AuthState> emit) async {
    emit(GoogleLoadingState());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await auth.signInWithProvider(googleAuthProvider);

      if (auth.currentUser != null) {
        emit(AuthLoadedState());
      } else {
        emit(AuthErrorState("User is null after Google Sign-In"));
      }
    } catch (error) {
      emit(AuthErrorState(error.toString()));
      print(error);
    }
  }

  Future<void> _logInWithFacebook(
      FacebookEvent event, Emitter<AuthState> emit) async {
    emit(FacebookLoadingState());
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();

      if (facebookLoginResult.status == LoginStatus.success) {
        final facebookAuthCredential = FacebookAuthProvider.credential(
            facebookLoginResult.accessToken!.tokenString);
        final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

        if (userCredential.user != null) {
          emit(AuthLoadedState());
        } else {
          emit(AuthErrorState('No user currently signed in.'));
        }
      } else if (facebookLoginResult.status == LoginStatus.cancelled) {
        emit(AuthInitial());
      } else if (facebookLoginResult.status == LoginStatus.failed) {
        emit(AuthErrorState('Facebook login failed: ${facebookLoginResult.message}'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.toString()));
    } catch (e) {
      emit(AuthErrorState('An unknown error occurred: ${e.toString()}'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await auth.signOut();
      emit(AuthLogoutState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}

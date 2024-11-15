import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_multi_app/shared/app_keys.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuth firebaseAuth, SharedPreferences sharedPreferences)
      : _firebaseAuth = firebaseAuth,
        _sharedPreferences = sharedPreferences,
        super(AuthInitial()) {
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
    on<AuthInitialEvent>(_init);
  }

  final FirebaseAuth _firebaseAuth;
  final SharedPreferences _sharedPreferences;

  Future<void> _init(AuthInitialEvent event, Emitter<AuthState> emit) async {
    if (_firebaseAuth.currentUser != null) {
      emit(AuthLoadedState());
    } else {
      emit(AuthInitial());
    }

    await _tokenListener();
  }

  Future<void> _tokenListener() async {
    final storage = await SharedPreferences.getInstance();
    try {
      _firebaseAuth.idTokenChanges().listen((user) async {
        if (user != null) {
          final userToken = await user.getIdToken();
          storage.setString(kToken, userToken!);
        } else {
          storage.remove(kToken);
        }
      });
    } catch (e) {
      log('[AuthBloc][_tokenListener] $e');
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
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
      await _firebaseAuth.signInWithProvider(googleAuthProvider);

      if (_firebaseAuth.currentUser != null) {
        emit(AuthLoadedState());
      } else {
        emit(AuthErrorState("User is null after Google Sign-In"));
      }
    } catch (error) {
      emit(AuthErrorState(error.toString()));
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
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        if (userCredential.user != null) {
          emit(AuthLoadedState());
        } else {
          emit(AuthErrorState('No user currently signed in.'));
        }
      } else if (facebookLoginResult.status == LoginStatus.cancelled) {
        emit(AuthInitial());
      } else if (facebookLoginResult.status == LoginStatus.failed) {
        emit(AuthErrorState(
            'Facebook login failed: ${facebookLoginResult.message}'));
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
      await _firebaseAuth.signOut();
      _sharedPreferences.clear();
      emit(AuthLogoutState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  String getUserEmail() {
    return _firebaseAuth.currentUser?.email ?? 'No email found';
  }

  String getUserName() {
    return _firebaseAuth.currentUser?.displayName ?? 'User name';
  }
}

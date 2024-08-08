import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
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

  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      if (event.email.isEmpty || event.password.isEmpty || event.name.isEmpty) {
        emit(AuthErrorState(LocaleKeys.fillOutAllFields.tr()));
        return;
      }

      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      await userCredential.user?.updateDisplayName(event.name);

      await userCredential.user?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.displayName == event.name) {
        emit(AuthLoadedState());
      } else {
        emit(AuthErrorState(LocaleKeys.failedUpdateProfile.tr()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState(LocaleKeys.passwordProvideWeek.tr()));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState(LocaleKeys.accountExistEmail.tr()));
      } else {
        emit(AuthErrorState(LocaleKeys.unexpectedOccurred.tr()));
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
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
    emit(AuthLoadingState());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await auth.signInWithProvider(googleAuthProvider);
      if (auth.currentUser != null) {
        emit(AuthLoadedState());
      } else {
        (e) => emit(AuthErrorState(e.toString()));
      }
      emit(AuthLoadedState());
    } catch (error) {
      emit(AuthErrorState(error.toString()));
      print(error);
    }
  }

  Future<void> _logInWithFacebook(
      FacebookEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();

      if (facebookLoginResult.status == LoginStatus.cancelled) {
        emit(AuthInitial());
        return;
      }
      if (facebookLoginResult.status == LoginStatus.operationInProgress) {
        emit(AuthLoadingState());
      }
      if (facebookLoginResult.status == LoginStatus.success) {
        emit(AuthLoadedState());
      }
      if (facebookLoginResult.status == LoginStatus.failed) {
        emit(AuthErrorState(LocaleKeys.facebookLoginFailed.tr()));
        return;
      }

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.tokenString);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      emit(AuthLoadedState());

    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.toString()));
      switch (e.code) {
        case 'account-exist-with-different-credential':
          emit(AuthErrorState(e.toString()));
          break;
        case 'invalid-credential':
          emit(AuthErrorState(e.toString()));
          break;
        case 'operation-not-allowed':
          emit(AuthErrorState(e.toString()));
          break;
        case 'user-disabled':
          emit(AuthErrorState(e.toString()));
          break;
        case 'user-not-found':
          emit(AuthErrorState(e.toString()));
          break;
      }
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}

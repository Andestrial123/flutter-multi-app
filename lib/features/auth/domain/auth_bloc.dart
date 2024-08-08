import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
        emit(AuthErrorState('Please fill out all fields'));
        return;
      }

      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      await userCredential.user?.updateProfile(displayName: event.name);

      await userCredential.user?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.displayName == event.name) {
        emit(AuthLoadedState());
      } else {
        emit(AuthErrorState('Failed to update user profile'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('The account already exists for that email'));
      } else {
        emit(AuthErrorState('An unexpected error occurred.'));
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
        emit(AuthErrorState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('Wrong password provided for that user.'));
      } else {
        emit(AuthErrorState('An unexpected error occurred.'));
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
        emit(AuthErrorState('Facebook login failed'));
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

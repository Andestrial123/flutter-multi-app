import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      print(credential);
      emit(AuthLoadedState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        emit(AuthErrorState('An unexpected error occurred.'));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      print(credential);
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

  Future<void> _handleGoogleSignIn(GoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await auth.signInWithProvider(googleAuthProvider);
      emit(AuthLoadedState());
    } catch (error) {
      print(error);
    }
  }

  Future<void> _logInWithFacebook(FacebookEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.tokenString);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });
    } on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exist-with-different-credential':
          title = 'This account exist with a different sign in provider';
          break;
        case 'invalid-credential':
          title = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed':
          title = 'This operation is not allowed';
          break;
        case 'user-disabled':
          title = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          title = 'The user you to log into was not found';
          break;
      }
    }
  }


  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await auth.signOut();
    emit(AuthInitial());
  }
}
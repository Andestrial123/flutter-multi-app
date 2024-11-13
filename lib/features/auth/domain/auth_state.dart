part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class GoogleLoadingState extends AuthState {}

class FacebookLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthScreenState extends AuthState {}

class SignUpScreenState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}

class AuthLogoutState extends AuthState {}

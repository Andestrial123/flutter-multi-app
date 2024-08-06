part of 'auth_bloc.dart';

sealed class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterEvent(this.email, this.password);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class GoogleEvent extends AuthEvent {}

class FacebookEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
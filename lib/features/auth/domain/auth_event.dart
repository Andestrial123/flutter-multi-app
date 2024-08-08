part of 'auth_bloc.dart';

sealed class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent(this.email, this.password, this.name);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class GoogleEvent extends AuthEvent {}

class FacebookEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class ShowSignUpScreenEvent extends AuthEvent {}

class ShowAuthScreenEvent extends AuthEvent {}

class ListenToAuthStateChanges extends AuthEvent {}

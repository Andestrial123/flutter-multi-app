part of 'sign_up_bloc.dart';

sealed class SignUpEvent {}

class RegisterEvent extends SignUpEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent(this.email, this.password, this.name);
}

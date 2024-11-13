part of 'sign_up_bloc.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpLoadedState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState(this.error);
}



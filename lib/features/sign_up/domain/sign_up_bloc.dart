import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<RegisterEvent>(_onRegister);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _onRegister(
      RegisterEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());
    try {
      if (event.email.isEmpty || event.password.isEmpty || event.name.isEmpty) {
        emit(SignUpErrorState(LocaleKeys.fillOutAllFields.tr()));
        return;
      }

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      await userCredential.user?.updateDisplayName(event.name);

      await userCredential.user?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.displayName == event.name) {
        emit(SignUpLoadedState());
      } else {
        emit(SignUpErrorState(LocaleKeys.failedUpdateProfile.tr()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpErrorState(LocaleKeys.passwordProvideWeek.tr()));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpErrorState(LocaleKeys.accountExistEmail.tr()));
      } else {
        emit(SignUpErrorState(LocaleKeys.unexpectedOccurred.tr()));
      }
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}

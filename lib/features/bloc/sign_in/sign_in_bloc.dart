import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/sign_in/sign_in_event.dart';
import 'package:micple_app/features/bloc/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState(isSigninButtonVisible: true)) {

    on<ToggleSignInButton>((event, emit) {
      debugPrint('ToggleSigninButton pressed');
      emit(SignInState(isSigninButtonVisible: !state.isSigninButtonVisible));
    });
  }
}
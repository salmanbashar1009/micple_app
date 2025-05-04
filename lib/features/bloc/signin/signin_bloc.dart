import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/signin/sign_event.dart';
import 'package:micple_app/features/bloc/signin/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninState(isSigninButtonVisible: true)) {

    on<ToggleSigninButton>((event, emit) {
      debugPrint('ToggleSigninButton pressed');
      emit(SigninState(isSigninButtonVisible: !state.isSigninButtonVisible));
    });
  }
}
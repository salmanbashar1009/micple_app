import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/home/sign_in_section/sign_event.dart';
import 'package:micple_app/features/bloc/home/sign_in_section/signin_state.dart';



class SignInSectionBloc extends Bloc<SignInSectionEvent, SignInSectionState> {
  SignInSectionBloc() : super(const SignInSectionState(isSigninButtonVisible: true)) {

    on<ToggleSigninButton>((event, emit) {
      debugPrint('ToggleSigninButton pressed');
      emit(SignInSectionState(isSigninButtonVisible: !state.isSigninButtonVisible));
    });
  }
}
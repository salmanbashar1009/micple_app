import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/signin/signin_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';

import 'app.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<SigninBloc>(create: (_)=> SigninBloc()),
          BlocProvider<SignupBloc>(create: (_)=> SignupBloc()),
        ],
        child: const MyApp()
    )
  );
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/home/home_screen_body/home_screen_body_bloc.dart';
import 'package:micple_app/features/bloc/home/home_screen_footer/home_screen_footer_bloc.dart';
import 'package:micple_app/features/bloc/home/sign_in_section/signin_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';

import 'app.dart';
import 'features/bloc/signup/text_form_bloc/text_form_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<SignInSectionBloc>(create: (_)=> SignInSectionBloc()),
          BlocProvider<SignupBloc>(create: (_)=> SignupBloc()),
          BlocProvider<TextFormBloc>(create: (_)=> TextFormBloc()),
          BlocProvider<HomeScreenFooterBloc>(create: (_)=> HomeScreenFooterBloc()),
          BlocProvider<HomeScreenBodyBloc>(create: (_)=> HomeScreenBodyBloc()),
        ],
        child: const MyApp()
    )
  );
}



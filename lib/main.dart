import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/core/services/storage/HiveStorageServices.dart';
import 'package:micple_app/features/bloc/home/home_screen_body/home_screen_body_bloc.dart';
import 'package:micple_app/features/bloc/home/home_screen_footer/home_screen_footer_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_bloc.dart';

import 'app.dart';
import 'features/bloc/sign_in/sign_in_bloc.dart';
import 'features/bloc/signup/text_form_bloc/text_form_bloc.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await HiveStorageServices.initialize();

  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(create: (_)=> SignInBloc()),
          BlocProvider<SignupBloc>(create: (_)=> SignupBloc()),
          BlocProvider<TextFormBloc>(create: (_)=> TextFormBloc()),
          BlocProvider<HomeScreenFooterBloc>(create: (_)=> HomeScreenFooterBloc()),
          BlocProvider<HomeScreenBodyBloc>(create: (_)=> HomeScreenBodyBloc()),
        ],
        child: const MyApp()
    )
  );
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/home/home_screen_body/home_screen_body_event.dart';
import 'package:micple_app/features/bloc/home/home_screen_body/home_screen_body_state.dart';

class HomeScreenBodyBloc extends Bloc<HomeScreenBodyEvent,HomeScreenBodyState>{
   HomeScreenBodyBloc(): super (const HomeScreenBodyState(
       selectedIndex: 0,
     tabs: [
       'News', 'Web', 'Posts', 'Pictures', 'Audios', 'Videos',
       'Notes', 'Stores', 'Futures', 'Campaigns', 'Jobs',
       'Laboratories', 'Assistants', 'Investments',
     ],
   )){
     on<TabChanged>(_onTabChanged);
   }

   void _onTabChanged(TabChanged event, Emitter emit){
     emit(state.copyWith(selectedIndex: event.index));
     debugPrint("Tab changed to : ${state.selectedIndex}");
   }
}
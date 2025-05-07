import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen_footer_event.dart';
import 'home_screen_footer_state.dart';

class HomeScreenFooterBloc extends Bloc<HomeScreenFooterEvent, HomeScreenFooterState> {
  HomeScreenFooterBloc() : super(const HomeScreenFooterState(
      hoveredValue: '',
    selectedItem: 'About us',
    menuItems: [ 'About us', 'Privacy Policy', 'Terms & Condition', 'Jobs Policy', 'Referral Program Policy', 'Campaign Policy', ],
    isTapped: false,
    isHovered: false,
  )) {
    on<OnHoverEvent>(_onHoverEvent);
    on<SelectedMenuItemEvent>(_onSelectedMenuItem);
    on<OpenMenuEvent>(_onOpenMenu);
    on<CloseMenuEvent>(_onCloseMenu);
    on<OnHoverFooterMenuEvent>(_onHoverFooterMenu);
  }

  /// Hover event handler for the footer menu items
  void _onHoverEvent(OnHoverEvent event, Emitter emit) {
    emit(state.copyWith(isHover: event.isHover));
    debugPrint("\nOn hover event received : ${state.hoveredValue}\n");
  }

  /// Selected footer menu item event handler
  void _onSelectedMenuItem(SelectedMenuItemEvent event, Emitter emit) {
    emit(state.copyWith(selectedItem: event.selectedItem));
  }

  /// Open menu event handler, on clicking the arrow footer menu will appear
  void _onOpenMenu(OpenMenuEvent event, Emitter emit) {
    emit(state.copyWith(isTapped: true));
  }

  /// Close menu event handler, on clicking the arrow footer menu will disappear
  void _onCloseMenu(CloseMenuEvent event, Emitter emit) {
    emit(state.copyWith(isTapped: false));
  }

  /// Hover event handler for the footer menu icon
  void _onHoverFooterMenu(OnHoverFooterMenuEvent event, Emitter emit) {
    emit(state.copyWith(isHovered: event.isHovered));
  }
}
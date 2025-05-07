import 'package:equatable/equatable.dart';

abstract class HomeScreenFooterEvent extends Equatable{
  const HomeScreenFooterEvent();

  @override
  List<Object?> get props => [];
}

class OnHoverEvent extends HomeScreenFooterEvent {
  final String isHover;

  const OnHoverEvent({required this.isHover});

  @override
  List<Object?> get props => [isHover];
}

class SelectedMenuItemEvent extends HomeScreenFooterEvent {
  final String selectedItem;

  const SelectedMenuItemEvent({required this.selectedItem});

  @override
  List<Object?> get props => [selectedItem];
}

class OpenMenuEvent extends HomeScreenFooterEvent {}
class CloseMenuEvent extends HomeScreenFooterEvent {}

class OnHoverFooterMenuEvent extends HomeScreenFooterEvent {
  final bool isHovered;
  const OnHoverFooterMenuEvent({required this.isHovered});

  @override
  List<Object?> get props => [isHovered];
}
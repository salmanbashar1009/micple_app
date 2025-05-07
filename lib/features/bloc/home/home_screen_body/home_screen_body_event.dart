import 'package:equatable/equatable.dart';

abstract class HomeScreenBodyEvent extends Equatable{
  const HomeScreenBodyEvent();

  @override
  List<Object?> get props => [];
}

class TabChanged extends HomeScreenBodyEvent {
  final int index;
  const TabChanged(this.index);

  @override
  List<Object?> get props => [index];
}
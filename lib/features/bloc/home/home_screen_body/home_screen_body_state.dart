import 'package:equatable/equatable.dart';

 class HomeScreenBodyState extends Equatable{
  final int selectedIndex;
  final List<String> tabs;
  const HomeScreenBodyState({required this.selectedIndex, required this.tabs});

  HomeScreenBodyState copyWith({int? selectedIndex, List<String>? tabs}){
    return HomeScreenBodyState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
      tabs: tabs ?? this.tabs
    );
  }
  @override
  List<Object?> get props => [selectedIndex];
}
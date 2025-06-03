import 'package:equatable/equatable.dart';

class HomeScreenFooterState extends Equatable{
  final String hoveredValue;
  final String selectedItem;
  final List<String> menuItems;
  final bool isTapped;
  final bool isHovered;

  const HomeScreenFooterState({required this.hoveredValue, required this.selectedItem, required this.menuItems, required this.isTapped, required this.isHovered});

  HomeScreenFooterState copyWith({String? isHover, String? selectedItem, List<String>? menuItems, bool? isTapped, bool? isHovered}){
    return HomeScreenFooterState(
      hoveredValue: isHover ?? hoveredValue,
      selectedItem: selectedItem ?? this.selectedItem,
      menuItems: menuItems ?? this.menuItems,
      isTapped: isTapped ?? this.isTapped ,
      isHovered: isHovered ?? this.isHovered,
    );
  }
  @override
  List<Object?> get props => [hoveredValue, selectedItem, menuItems, isTapped, isHovered];
}

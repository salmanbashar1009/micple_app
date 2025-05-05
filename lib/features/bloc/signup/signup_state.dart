import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final Map<String, bool> focusMap;
  final Map<String, bool> hoverMap;
  final Map<String, dynamic> dropdownValues;
  final String? hoveredValue;

  const SignupState({
    required this.focusMap,
    required this.hoverMap,
    required this.dropdownValues,
    this.hoveredValue,
  });

  /// Creates a new state by copying existing values and updating only specified fields
  SignupState copyWith({
    Map<String, bool>? focusMap,
    Map<String, bool>? hoverMap,
    Map<String, dynamic>? dropdownValues,
    String? hoveredValue,
  }) {
    return SignupState(
      focusMap: focusMap ?? this.focusMap,
      hoverMap: hoverMap ?? this.hoverMap,
      dropdownValues: dropdownValues ?? this.dropdownValues,
      hoveredValue: hoveredValue ?? this.hoveredValue,
    );
  }

  @override
  List<Object?> get props => [focusMap, hoverMap, dropdownValues, hoveredValue];
}
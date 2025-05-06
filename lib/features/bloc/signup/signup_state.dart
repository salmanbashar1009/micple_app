import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final Map<String, bool> focusMap;
  final Map<String, bool> hoverMap;
  final Map<String, dynamic> dropdownValues;
  final String? hoveredValue;
  final bool isTermsAccepted;

  const SignupState({
    required this.focusMap,
    required this.hoverMap,
    required this.dropdownValues,
    this.hoveredValue,
    required this.isTermsAccepted
  });

  /// Creates a new state by copying existing values and updating only specified fields
  SignupState copyWith({
    Map<String, bool>? focusMap,
    Map<String, bool>? hoverMap,
    Map<String, dynamic>? dropdownValues,
    String? hoveredValue,
    bool? isTermsAccepted,
  }) {
    return SignupState(
      focusMap: focusMap ?? this.focusMap,
      hoverMap: hoverMap ?? this.hoverMap,
      dropdownValues: dropdownValues ?? this.dropdownValues,
      hoveredValue: hoveredValue ?? this.hoveredValue,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted
    );
  }

  @override
  List<Object?> get props => [focusMap, hoverMap, dropdownValues, hoveredValue,isTermsAccepted];
}
import 'package:equatable/equatable.dart';

// class SignupState extends Equatable {
//   final Map<String, bool> focusMap;
//   final Map<String, bool> hoverMap; // 👈 Track hover state per field
//   final Map<String,String> dropdownValues;
//
//   const SignupState({
//     required this.focusMap,
//     required this.hoverMap,
//     required this.dropdownValues,
//   });
//
//   SignupState copyWith({
//     Map<String, bool>? focusMap,
//     Map<String, bool>? hoverMap,
//     Map<String, String>? dropdownValues,
//   }) {
//     return SignupState(
//       focusMap: focusMap ?? this.focusMap,
//       hoverMap: hoverMap ?? this.hoverMap,
//       dropdownValues: dropdownValues ?? this.dropdownValues,
//     );
//   }
//
// }

class SignupState extends Equatable {
  final Map<String, bool> focusMap;
  final Map<String, bool> hoverMap;
  final Map<String, dynamic> dropdownValues;
  final String? hoveredGender;

  const SignupState({
    required this.focusMap,
    required this.hoverMap,
    required this.dropdownValues,
    required this.hoveredGender
  });

  /// Creates a new state by copying existing values and updating only specified fields
  SignupState copyWith({
    Map<String, bool>? focusMap,
    Map<String, bool>? hoverMap,
    Map<String, dynamic>? dropdownValues,
    String? hoveredGender,
  }) {
    return SignupState(
      focusMap: focusMap ?? this.focusMap,
      hoverMap: hoverMap ?? this.hoverMap,
      dropdownValues: dropdownValues ?? this.dropdownValues,
      hoveredGender:  hoveredGender ?? this.hoveredGender,
    );
  }

  @override
  List<Object?> get props => [focusMap, hoverMap,dropdownValues, hoveredGender];
}
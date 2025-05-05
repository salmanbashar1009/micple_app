import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class TextFieldFocusedEvent extends SignupEvent {
  final String fieldKey;
  final bool isFocused;

  TextFieldFocusedEvent({required this.fieldKey, required this.isFocused});
}

class OnHoverToolTipEvent extends SignupEvent {
  final String fieldKey;
  final bool isHover;

  const OnHoverToolTipEvent({required this.fieldKey, required this.isHover});

  @override
  List<Object?> get props => [fieldKey, isHover];
}

class DropdownValueChangedEvent extends SignupEvent {
  final String fieldKey;
  final String selectedValue;

  const DropdownValueChangedEvent(
      {required this.fieldKey, required this.selectedValue});

  @override
  List<Object?> get props => [fieldKey, selectedValue];
}

class OnHoverEvent extends SignupEvent {
  final String? value;

  const OnHoverEvent({required this.value});

  @override
  List<Object?> get props => [value];
}
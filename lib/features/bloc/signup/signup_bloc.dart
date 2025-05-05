import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/signup/signup_event.dart';
import 'package:micple_app/features/bloc/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  /// Initializing the BLoC with empty focus and hover maps
  SignupBloc()
      : super(const SignupState(
      focusMap: {},
      hoverMap: {},
      dropdownValues: {},
      hoveredValue: null)) {
    /// Handles text field focus changes (onFocus)
    on<TextFieldFocusedEvent>((event, emit) {
      final updatedFocus = Map<String, bool>.from(state.focusMap)
        ..[event.fieldKey] = event.isFocused;

      /// Emit new state with updated focus map using copyWith
      emit(state.copyWith(focusMap: updatedFocus));
    });

    /// Handles hover events for tooltip icons in text fields
    on<OnHoverToolTipEvent>((event, emit) {
      final updatedHover = Map<String, bool>.from(state.hoverMap)
        ..[event.fieldKey] = event.isHover;

      /// Emit new state with updated hover map using copyWith
      emit(state.copyWith(hoverMap: updatedHover));
    });

    /// Handles drop down values for date picker
    on<DropdownValueChangedEvent>((event, emit) {
      final updatedDropDownValues = Map<String, String>.from(state.dropdownValues)
        ..[event.fieldKey] = event.selectedValue;

      emit(state.copyWith(dropdownValues: updatedDropDownValues));
    });

    /// Handles hover events for dropdown menu items
    on<OnHoverEvent>((event, emit) {
      debugPrint('Hover event received: ${event.value}');
      emit(state.copyWith(hoveredValue: event.value));
    });
  }

  // void _onUpdateField(UpdateFieldEvent event, Emitter<FormState> emit) {
  //   final currentFields = Map<String, dynamic>.from(state.fields);
  //   currentFields[event.field] = event.value;
  //   emit(FormState(currentFields));
  // }

  bool canEditField(String currentField, String nextField) {
    return state.focusMap[currentField] == null || state.focusMap[nextField] == '';
  }

  // fun canEditField(currentField: String, nextField: String): Boolean {
  // return state.focusMap[currentField] == null || state.focusMap[nextField] == false
  // }

  /// Optional utility method for checking if a field is currently focused
  bool isFocused(String key) => state.focusMap[key] ?? false;
}
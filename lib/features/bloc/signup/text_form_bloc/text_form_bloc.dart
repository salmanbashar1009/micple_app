import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_event.dart';
import 'package:micple_app/features/bloc/signup/text_form_bloc/text_form_state.dart';

class TextFormBloc extends Bloc<TextFormEvent, TextFormState> {
  TextFormBloc() : super(TextFormState({
    'firstName': null,
    'lastName': null,
    'fatherName': null,
    'motherName': null,
    'year': null,
    'month': null,
    'day': null,
    'gender': null,
    'address': null,
    'city': null,
    'state': null,
    'zipCode': null,
    'nationalId': null,
    'phoneNumber': null,
    'password': null,
    'confirmPassword': null,
  })) {
    on<UpdateFieldEvent>(_onUpdateField);
  }

  void _onUpdateField(event, emit) {
    final currentFields = Map<String, dynamic>.from(state.fields);
    currentFields[event.field] = event.value;
    emit(TextFormState(currentFields));
  }

  bool canEditField(String currentField, String nextField) {
    return state.fields[nextField] == null || state.fields[nextField] == '';
  }
}
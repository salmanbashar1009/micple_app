import 'package:equatable/equatable.dart';

abstract class TextFormEvent extends Equatable{
  const TextFormEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFieldEvent extends TextFormEvent {
  final String field;
  final dynamic value;

  const UpdateFieldEvent({required this.field, required this.value});

  @override
  List<Object?> get props => [field, value];
}
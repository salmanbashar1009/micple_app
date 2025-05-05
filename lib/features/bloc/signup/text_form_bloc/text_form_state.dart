import 'package:equatable/equatable.dart';

class TextFormState extends Equatable {
  final Map<String, dynamic> fields;

  const TextFormState(this.fields);

  @override
  List<Object?> get props => [fields];
}
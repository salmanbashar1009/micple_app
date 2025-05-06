// toggle_state.dart
import 'package:equatable/equatable.dart';

class SignInSectionState extends Equatable {
  final bool isSigninButtonVisible;

  const SignInSectionState({required this.isSigninButtonVisible});

  @override
  List<Object?> get props => [isSigninButtonVisible];
}

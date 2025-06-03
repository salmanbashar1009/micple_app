// toggle_state.dart
import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final bool isSigninButtonVisible;

  const SignInState({required this.isSigninButtonVisible});

  @override
  List<Object?> get props => [isSigninButtonVisible];
}

// toggle_state.dart
import 'package:equatable/equatable.dart';

class SigninState extends Equatable {
  final bool isSigninButtonVisible;

  const SigninState({required this.isSigninButtonVisible});

  @override
  List<Object?> get props => [isSigninButtonVisible];
}

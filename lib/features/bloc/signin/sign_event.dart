import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{
  const SigninEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [

  ];
}

class ToggleSigninButton extends SigninEvent{}
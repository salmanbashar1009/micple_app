import 'package:equatable/equatable.dart';

abstract class SignInSectionEvent extends Equatable{
  const SignInSectionEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [

  ];
}

class ToggleSigninButton extends SignInSectionEvent{}
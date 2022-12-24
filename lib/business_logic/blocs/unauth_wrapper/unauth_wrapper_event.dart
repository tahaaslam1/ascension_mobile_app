part of 'unauth_wrapper_bloc.dart';

abstract class UnauthWrapperEvent extends Equatable {
  const UnauthWrapperEvent();

  @override
  List<Object> get props => [];
}

class NavigateToLoginScreen extends UnauthWrapperEvent {}

class NavigateToRegistrationScreen extends UnauthWrapperEvent {}

class NavigateToEmailVerificationScreen extends UnauthWrapperEvent {
  final String email;
  const NavigateToEmailVerificationScreen({required this.email});
  @override
  List<Object> get props => [email];
}

part of 'unauth_wrapper_bloc.dart';

abstract class UnauthWrapperState extends Equatable {
  const UnauthWrapperState();

  @override
  List<Object> get props => [];
}

class OnLoginScreen extends UnauthWrapperState {}

class OnRegistrationScreen extends UnauthWrapperState {}

class OnEmailVerificationScreen extends UnauthWrapperState {
  final String email;
  const OnEmailVerificationScreen({required this.email});
  @override
  List<Object> get props => [email];
}

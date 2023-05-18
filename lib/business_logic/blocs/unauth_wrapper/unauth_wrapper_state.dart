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
  final String userId;
  const OnEmailVerificationScreen({required this.email, required this.userId});
  @override
  List<Object> get props => [email];
}

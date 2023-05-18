part of 'email_verification_cubit.dart';

abstract class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationSending extends EmailVerificationState {}

class EmailVerificationSent extends EmailVerificationState {}

class EmailVerificationError extends EmailVerificationState {
  final String errorMessage;

  const EmailVerificationError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

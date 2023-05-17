part of 'email_verification_cubit.dart';

abstract class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

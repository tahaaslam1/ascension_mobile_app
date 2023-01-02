part of 'login_screen_cubit.dart';

abstract class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object> get props => [];
}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenError extends LoginScreenState {
  final String errorMessage;
  const LoginScreenError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
  
part of 'auth_wrapper_bloc.dart';

abstract class AuthWrapperState extends Equatable {
  const AuthWrapperState();

  @override
  List<Object> get props => [];
}

class OnNavigatorScreen extends AuthWrapperState {}

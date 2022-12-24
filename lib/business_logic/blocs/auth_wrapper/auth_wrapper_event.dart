part of 'auth_wrapper_bloc.dart';

abstract class AuthWrapperEvent extends Equatable {
  const AuthWrapperEvent();

  @override
  List<Object> get props => [];
}

class NavigateToNavigatorScreen extends AuthWrapperEvent {}
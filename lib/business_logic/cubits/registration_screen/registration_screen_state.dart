part of 'registration_screen_cubit.dart';

abstract class RegistrationScreenState extends Equatable {
  final UserType userType;
  const RegistrationScreenState({this.userType = UserType.buyer});

  @override
  List<Object> get props => [userType];
}

class RegistrationScreenInitial extends RegistrationScreenState {
  const RegistrationScreenInitial({UserType userType = UserType.buyer}) : super(userType: userType);
}

class RegistrationScreenLoading extends RegistrationScreenState {
  const RegistrationScreenLoading({required UserType userType}) : super(userType: userType);
}

class RegistrationScreenError extends RegistrationScreenState {
  final String errorMessage;
  const RegistrationScreenError({required this.errorMessage, required UserType userType}) : super(userType: userType);
  @override
  List<Object> get props => [errorMessage, userType];
}

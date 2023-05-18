import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unauth_wrapper_event.dart';
part 'unauth_wrapper_state.dart';

class UnauthWrapperBloc extends Bloc<UnauthWrapperEvent, UnauthWrapperState> {
  UnauthWrapperBloc() : super(OnLoginScreen()) {
    on<NavigateToLoginScreen>((event, emit) async {
      emit(OnLoginScreen());
    });
    on<NavigateToRegistrationScreen>((event, emit) async {
      emit(OnRegistrationScreen());
    });
    on<NavigateToEmailVerificationScreen>((event, emit) async {
      emit(OnEmailVerificationScreen(email: event.email, userId: event.userId));
    });
  }
}

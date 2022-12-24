import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_wrapper_event.dart';
part 'auth_wrapper_state.dart';

class AuthWrapperBloc extends Bloc<AuthWrapperEvent, AuthWrapperState> {
  AuthWrapperBloc() : super(OnNavigatorScreen()) {
    on<NavigateToNavigatorScreen>((event, emit) {
      emit(OnNavigatorScreen());
    });
  }
}

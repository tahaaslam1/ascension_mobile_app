import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final AuthRepository _authRepository;
  LoginScreenCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginScreenInitial());

  Future<void> login({
    required String email,
    required String password,
    /*required VoidCallback onEmailNotConfirmed*/
  }) async {
    emit(LoginScreenLoading());
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      logger.i('User Signed in successfully');
      emit(LoginScreenLoading());
    } on Failure catch (e) {
      final errorMessage = e.message;
      emit(LoginScreenError(errorMessage: errorMessage));
    }
  }
}

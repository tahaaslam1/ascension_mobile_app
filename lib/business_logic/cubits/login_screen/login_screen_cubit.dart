import 'package:ascension_mobile_app/data/exceptions/auth_exception.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(LoginScreenError(errorMessage: errorMessage));
    }
  }
}

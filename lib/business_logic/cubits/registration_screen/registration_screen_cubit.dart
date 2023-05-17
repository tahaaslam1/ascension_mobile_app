import 'package:ascension_mobile_app/data/exceptions/auth_exception.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_screen_state.dart';

class RegistrationScreenCubit extends Cubit<RegistrationScreenState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  RegistrationScreenCubit({required AuthRepository authRepository, required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const RegistrationScreenInitial());

  Future<void> register({required Map<String, dynamic> userData, required VoidCallback onRegistered}) async {
    emit(RegistrationScreenLoading(userType: state.userType));
    try {
      await _authRepository.signUpWithEmailAndPassword(userData: userData);

      userData.remove('password');

      onRegistered();
    } on Failure catch (e) {
      emit(RegistrationScreenError(errorMessage: e.message, userType: state.userType));
    }
  }

  Future<void> isUserExists({required String email, required VoidCallback onFalse}) async {
    emit(RegistrationScreenLoading(userType: state.userType));
    try {
      bool response = await _authRepository.userAlreadyExists(email: email);

      if (response == false) {
        emit(const RegistrationScreenInitial());
        onFalse();
      } else {
        emit(RegistrationScreenError(errorMessage: AppMessageService.registrationAlreadyRegisteredMessage, userType: state.userType));
      }
    } on Failure catch (e) {
      logger.e(e);

      emit(RegistrationScreenError(errorMessage: AppMessageService.genericErrorMessage, userType: state.userType));
    }
  }

  void updateUsertype({required UserType usertype}) {
    emit(RegistrationScreenInitial(userType: usertype));
  }
}

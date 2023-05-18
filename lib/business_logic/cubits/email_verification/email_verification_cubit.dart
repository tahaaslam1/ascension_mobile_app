import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final AuthRepository _authenticationRepository;

  EmailVerificationCubit({
    required AuthRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(EmailVerificationInitial());

  Future<void> sendEmailVerification(String userId, String otp, VoidCallback emailSent) async {
    emit(EmailVerificationSending());

    try {
      await _authenticationRepository.sendEmailVerification(userId: userId, otp: otp);
      emit(EmailVerificationSent());
      emailSent();
    } on Failure catch (e) {
      logger.e(e);
      emit(const EmailVerificationError(errorMessage: AppMessageService.genericErrorMessage));
    }
  }
}

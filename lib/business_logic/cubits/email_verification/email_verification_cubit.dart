import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial());
}

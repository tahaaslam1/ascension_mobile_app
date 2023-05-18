import 'package:ascension_mobile_app/business_logic/blocs/unauth_wrapper/unauth_wrapper_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/email_verification/email_verification_cubit.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/screens/email_verification_screen/local_widgets/otp_container.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/dashed_button.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String route = 'verify-email';
  final String userId;
  final String email;
  final _formKey = GlobalKey<FormBuilderState>();

  TextEditingController o1 = TextEditingController();
  TextEditingController o2 = TextEditingController();
  TextEditingController o3 = TextEditingController();
  TextEditingController o4 = TextEditingController();

  EmailVerificationScreen({Key? key, required this.userId, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<EmailVerificationScreenCubit,
    //     EmailVerificationScreenState>(
    //   listener: (context, state) {
    //     if (state is EmailVerificationScreenError) {
    //       SnackBarService.showGenericErrorSnackBar(
    //           context, state.errorMessage);
    //     }
    //   },
    //   buildWhen: (previous, current) =>
    //       current is! EmailVerificationScreenError,
    //   builder: (context, state) {
    //     final EmailVerificationScreenCubit emailVerificationScreenCubit =
    //         BlocProvider.of<EmailVerificationScreenCubit>(context);
    return BlocProvider<EmailVerificationCubit>(
      create: (context) => EmailVerificationCubit(authenticationRepository: context.read<AuthRepository>()),
      child: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
        listener: (context, state) {
          if (state is EmailVerificationError) {
            SnackBarService.showGenericErrorSnackBar(context, 'Unable to verify OTP');
          }
        },
        buildWhen: (previous, current) => current is! EmailVerificationError,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: CustomAppBarAndBody(
                showBackButton: false,
                title: "Email Verification",
                body: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Image.asset('assets/images/email_verification.png'),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          Text(
                            "We have sent a code to $email.",
                            style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OTPcontainer(
                                name: "b1",
                                controller: o1,
                                // focusNode: FocusNode(),
                                keyboardType: TextInputType.number,
                                validators: (p0) {
                                  return null;
                                },
                              ),
                              const Spacer(),
                              OTPcontainer(
                                name: "b2",
                                controller: o2,
                                // focusNode: FocusNode(),
                                keyboardType: TextInputType.number,
                                validators: (p0) {
                                  return null;
                                },
                              ),
                              const Spacer(),
                              OTPcontainer(
                                name: "b3",
                                controller: o3,
                                keyboardType: TextInputType.number,
                                // focusNode: FocusNode(),
                                validators: (p0) {
                                  return null;
                                },
                              ),
                              const Spacer(),
                              OTPcontainer(
                                name: "b4",
                                controller: o4,
                                keyboardType: TextInputType.number,
                                // focusNode: FocusNode(),
                                validators: (p0) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: CustomElevatedButton(
                              isLoading: state is EmailVerificationSending,
                              buttonText: 'VERIFY MY EMAIL',
                              //  onPressed: () => emailVerificationScreenCubit.resendVerificationEmail(email),
                              onPressed: () {
                                if (o1.text.isNotEmpty && o2.text.isNotEmpty && o3.text.isNotEmpty && o4.text.isNotEmpty) {
                                  final otp = o1.text + o2.text + o3.text + o4.text;
                                  BlocProvider.of<EmailVerificationCubit>(context).sendEmailVerification(userId, otp, () {
                                    SnackBarService.showConfirmationSnackBar(context, 'Email verified successfully');
                                    BlocProvider.of<UnauthWrapperBloc>(context).add(NavigateToLoginScreen());
                                  });
                                } else {
                                  SnackBarService.showGenericErrorSnackBar(context, "Please enter the OTP");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  //   );
}
//}

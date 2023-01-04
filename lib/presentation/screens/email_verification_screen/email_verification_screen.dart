import 'package:ascension_mobile_app/business_logic/blocs/unauth_wrapper/unauth_wrapper_bloc.dart';
import 'package:ascension_mobile_app/presentation/screens/email_verification_screen/local_widgets/otp_container.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/dashed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String route = 'verify-email';
  final String email;
  const EmailVerificationScreen({Key? key, required this.email})
      : super(key: key);

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
    return Scaffold(
      body: SafeArea(
        child: CustomAppBarAndBody(
          showBackButton: false,
          title: "Email Verification",
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Image.asset('assets/images/email_verification.png'),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  "We have sent a code to $email.",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.surfaceVariant),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OTPcontainer(
                      name: "Taha Aslam",
                      controller: TextEditingController(),
                      validators: (p0) {
                        return null;
                      },
                    ),
                    Spacer(),
                    OTPcontainer(
                      name: "Taha Aslam",
                      controller: TextEditingController(),
                      validators: (p0) {
                        return null;
                      },
                    ),
                    Spacer(),
                    OTPcontainer(
                      name: "Taha Aslam",
                      controller: TextEditingController(),
                      validators: (p0) {
                        return null;
                      },
                    ),
                    Spacer(),
                    OTPcontainer(
                      name: "Taha Aslam",
                      controller: TextEditingController(),
                      validators: (p0) {
                        return null;
                      },
                    ),
                    Spacer(),
                    OTPcontainer(
                      name: "Taha Aslam",
                      controller: TextEditingController(),
                      validators: (p0) {
                        return null;
                      },
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CustomElevatedButton(
                    //   isLoading: state is EmailVerificationSending,
                    buttonText: 'RESEND VERIFICATION EMAIL',
                    //  onPressed: () => emailVerificationScreenCubit.resendVerificationEmail(email),
                    onPressed: (() {}),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Or if you have already verified",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context).colorScheme.surfaceVariant),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: DashedButton(
                    buttonText: 'LOGIN',
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    onPressed: () => BlocProvider.of<UnauthWrapperBloc>(context)
                        .add(NavigateToLoginScreen()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //   );
}
//}

// import 'package:ascension_mobile_app/business_logic/blocs/unauth_wrapper/unauth_wrapper_bloc.dart';
// import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
// import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
// import 'package:ascension_mobile_app/presentation/widgets/dashed_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EmailVerificationScreen extends StatelessWidget {
//   static const String route = 'verify-email';
//   final String email;
//   const EmailVerificationScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => EmailVerificationScreenCubit(authRepository: RepositoryProvider.of<AuthRepository>(context)),
//       child: BlocConsumer<EmailVerificationScreenCubit, EmailVerificationScreenState>(
//         listener: (context, state) {
//           if (state is EmailVerificationScreenError) {
//             SnackBarService.showGenericErrorSnackBar(context, state.errorMessage);
//           }
//         },
//         buildWhen: (previous, current) => current is! EmailVerificationScreenError,
//         builder: (context, state) {
//           final EmailVerificationScreenCubit emailVerificationScreenCubit = BlocProvider.of<EmailVerificationScreenCubit>(context);
//           return Scaffold(
//             body: SafeArea(
//               child: CustomAppBarAndBody(
//                 showBackButton: false,
//                 title: "Email Verification",
//                 body: Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Center(
//                         child: Image.asset('assets/images/email_verification.png'),
//                       ),
//                       const SizedBox(
//                         height: 48,
//                       ),
//                       Text(
//                         "We have sent a code to $email.",
//                         style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 48,
//                         child: CustomElevatedButton(
//                           isLoading: state is EmailVerificationSending,
//                           buttonText: 'RESEND VERIFICATION EMAIL',
//                           onPressed: () => emailVerificationScreenCubit.resendVerificationEmail(email),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Text(
//                             "Or if you have already verified",
//                             style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 48,
//                         child: DashedButton(
//                           buttonText: 'LOGIN',
//                           color: Theme.of(context).colorScheme.onSecondaryContainer,
//                           onPressed: () => BlocProvider.of<UnauthWrapperBloc>(context).add(NavigateToLoginScreen()),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

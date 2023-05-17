import 'package:ascension_mobile_app/business_logic/blocs/unauth_wrapper/unauth_wrapper_bloc.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnAuthWrapperScreen extends StatelessWidget {
  static const String route = '/unauth';
  const UnAuthWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UnauthWrapperBloc>(
      create: (context) => UnauthWrapperBloc(),
      child: BlocBuilder<UnauthWrapperBloc, UnauthWrapperState>(
        builder: (context, state) {
          return AutoRouter.declarative(
            routes: (_) {
              return [
                if (state is OnLoginScreen) LoginRoute() else if (state is OnRegistrationScreen) const RegistrationFlowRoute() else if (state is OnEmailVerificationScreen) EmailVerificationRoute(email: state.email),
              ];
            },
          );
        },
      ),
    );
  }
}

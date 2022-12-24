import 'package:ascension_mobile_app/business_logic/blocs/auth_wrapper/auth_wrapper_bloc.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapperScreen extends StatelessWidget {
  static const String route = '/auth';
  const AuthWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthWrapperBloc>(
      create: (context) => AuthWrapperBloc(),
      child: BlocBuilder<AuthWrapperBloc, AuthWrapperState>(
        builder: (context, state) {
          return AutoRouter.declarative(
            routes: (_) {
              return [NavigatorRoute()];
            },
          );
        },
      ),
    );
  }
}

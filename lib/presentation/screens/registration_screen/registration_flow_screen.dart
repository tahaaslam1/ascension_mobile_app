import 'package:ascension_mobile_app/business_logic/cubits/registration_screen/registration_screen_cubit.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/presentation/screens/registration_screen/registration_flow_screen_one.dart';
import 'package:ascension_mobile_app/presentation/screens/registration_screen/registration_flow_screen_two.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegistrationFlowScreen extends StatefulWidget {
  static const String route = 'register';

  const RegistrationFlowScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationFlowScreen> createState() => _RegistrationFlowScreenState();
}

class _RegistrationFlowScreenState extends State<RegistrationFlowScreen> {
  final _registrationFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RegistrationScreenCubit(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
          child: BlocListener<RegistrationScreenCubit, RegistrationScreenState>(
            listener: (context, state) {
              if (state is RegistrationScreenError) {
                SnackBarService.showGenericErrorSnackBar(context, state.errorMessage);
              }
            },
            child: FormBuilder(
              key: _registrationFormKey,
              child: FlowView(
                steps: [
                  FlowScreen.custom(child: RegistrationFlowScreenOne()),
                  FlowScreen.custom(child: RegistrationFlowScreenTwo()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

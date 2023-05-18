import 'package:ascension_mobile_app/business_logic/blocs/unauth_wrapper/unauth_wrapper_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/registration_screen/registration_screen_cubit.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/dashed_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegistrationFlowScreenOne extends StatelessWidget {
  RegistrationFlowScreenOne({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final unauthWrapperBloc = BlocProvider.of<UnauthWrapperBloc>(context);
    return BlocBuilder<RegistrationScreenCubit, RegistrationScreenState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/ascension-logo.png',
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                const SizedBox(
                  height: 48 / 2,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/registration_screen.png',
                    height: 248,
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
                Text("Register", style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.left),
                const SizedBox(
                  height: 28 / 4,
                ),
                CustomFormBuilderTextField(
                  name: "email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email Address",
                  prefixIcon: const Icon(Icons.alternate_email),
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 16 / 2),
                CustomFormBuilderTextField(
                  name: "password",
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: "Password",
                  isPassword: true,
                  prefixIcon: const Icon(Icons.lock),
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                  ]),
                ),
                const SizedBox(
                  height: 24 / 2,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 48,
                  child: CustomElevatedButton(
                    buttonText: 'REGISTER',
                    isLoading: state is RegistrationScreenLoading,
                    onPressed: () {
                      if (FormBuilder.of(context)!.saveAndValidate()) {
                        FlowView.of(context).setIsLoading(true);
                        BlocProvider.of<RegistrationScreenCubit>(context).isUserExists(
                          email: FormBuilder.of(context)!.value['email'],
                          onFalse: () {
                            FlowView.of(context).setIsLoading(false);
                            FlowView.of(context).next();
                          },
                        );
                      }
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                    child: Text(
                      "Or if you're already a member",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
                    ),
                  ),
                ),
                DashedButton(
                  buttonText: "LOGIN IN",
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  onPressed: () {
                    unauthWrapperBloc.add(NavigateToLoginScreen());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

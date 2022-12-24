import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/dashed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: FormBuilder(
        child:

            // BlocProvider<LoginScreenCubit>(
            //   create: (context) => LoginScreenCubit(authRepository: RepositoryProvider.of<AuthRepository>(context)),
            //   child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
            //     listener: (context, state) {
            //       if (state is LoginScreenError) {
            //         SnackBarService.showGenericErrorSnackBar(context, state.errorMessage);
            //       }
            //     },
            //     builder: (context, state) {
            //       final loginCubit = BlocProvider.of<LoginScreenCubit>(context);
            //       final unauthWrapperBloc = BlocProvider.of<UnauthWrapperBloc>(context);
            //       final formState = FormBuilder.of(context)!;
            // return
            Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/images/ascension-logo.png')),
                    const SizedBox(
                      height: 48 / 2,
                    ),
                    Center(child: Image.asset('assets/images/login_screen.png')),
                    const SizedBox(
                      height: 56 / 4,
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Text("Login", style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.left),
                    const SizedBox(
                      height: 28 / 4,
                    ),
                    CustomFormBuilderTextField(
                      name: "login_email",
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
                      name: "login_password",
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
                      height: 28,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 48,
                      child: CustomElevatedButton(
                        buttonText: 'LOGIN',
                        isLoading: false, //state is LoginScreenLoading,
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          // if (formState.saveAndValidate()) {
                          //   logger.i('Form is valid');
                          //   loginCubit.login(
                          //     email: formState.value['login_email'],
                          //     password: formState.value['login_password'],
                          //     onEmailNotConfirmed: () => unauthWrapperBloc.add(
                          //       NavigateToEmailVerificationScreen(
                          //         email: formState.value['login_email'],
                          //       ),
                          //     ),
                          //   );
                          // }
                        },
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Or if you are new here",
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
                        ),
                      ),
                    ),
                    DashedButton(
                      buttonText: "SIGN UP",
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      onPressed: () {
                        //    unauthWrapperBloc.add(NavigateToRegistrationScreen());
                      },
                      dashLineRadius: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //   },
    //  ),
    //  ),
    // ),
    //);
  }
}

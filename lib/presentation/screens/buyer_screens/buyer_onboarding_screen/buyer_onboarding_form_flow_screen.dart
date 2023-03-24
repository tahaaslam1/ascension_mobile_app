// ignore_for_file: must_be_immutable
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/buyer_onboarding_screen/buyer_onboarding_form_step_three.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/buyer_onboarding_screen/buyer_onboarding_form_step_two.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen_widgets.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'buyer_onboarding_form_step_one.dart';

class BuyerOnboardingFormFlowScreen extends StatelessWidget {
  static const String route = 'buyer-onboarding-form-flow-screen';
  final _formKey = GlobalKey<FormBuilderState>();

  BuyerOnboardingFormFlowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: FlowView(
            steps: [
              FlowScreen(
                title: 'Welcome Aboard',
                anchor: FlowScreenDefaultAnchor(
                  buttonText: 'Continue',
                  onPressed: (context) {
                    if (_formKey.currentState!.saveAndValidate()) {
                      FlowView.of(context).next();
                    }
                  },
                ),
                child: BuyerOnBoardingStepOne(
                  formKey: _formKey,
                ),
              ),
              FlowScreen(
                title: 'Welcome Aboard',
                anchor: FlowScreenDefaultAnchor(
                  buttonText: 'Continue',
                  onPressed: (context) {
                    if (_formKey.currentState!.saveAndValidate()) {
                      FlowView.of(context).next();
                    }
                  },
                ),
                child: BuyerOnBoardingStepTwo(
                  formKey: _formKey,
                ),
              ),
              FlowScreen(
                title: 'Welcome Aboard',
                anchor: FlowScreenDefaultAnchor(
                  buttonText: 'Continue',
                  onPressed: (context) {
                    if (_formKey.currentState!.saveAndValidate()) {
                      FlowView.of(context).next();
                    }
                  },
                ),
                child: BuyerOnBoardingStepThree(
                  formKey: _formKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

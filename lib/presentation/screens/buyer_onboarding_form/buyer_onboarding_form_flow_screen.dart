import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen_widgets.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuyerOnBoardingFormFlowScreen extends StatelessWidget {
  static const String route = 'buyer-onboarding-form-flow-screen';
  final _formKey = GlobalKey<FormBuilderState>();
  BuyerOnBoardingFormFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FormBuilder(
        key: _formKey,
        child: FlowView(
          steps: [
            FlowScreen(
              title: 'Hello {Buyer Name here}',
              anchor: FlowScreenDefaultAnchor(buttonText: 'Continue', onPressed: (context) {},),
              child: SizedBox(),
            )
          ],
        ),
      )),
    );
  }
}

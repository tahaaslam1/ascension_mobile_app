import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../widgets/custom_formbuilder_textfield.dart';

class BuyerOnBoardingStepTwo extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  BuyerOnBoardingStepTwo({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomFormBuilderTextField(
            name: "degree",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Your Degree",
            validators: FormBuilderValidators.compose([
              // FormBuilderValidators.required(),
              FormBuilderValidators.max(25),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomFormBuilderTextField(
            name: "major",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Your Major",
            validators: FormBuilderValidators.compose([
              // FormBuilderValidators.required(),
              FormBuilderValidators.max(25),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomFormBuilderTextField(
            name: "degree",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Institute",
            validators: FormBuilderValidators.compose([
              //  FormBuilderValidators.required(),
              FormBuilderValidators.max(25),
            ]),
          ),
        ),
      ]),
    );
  }
}

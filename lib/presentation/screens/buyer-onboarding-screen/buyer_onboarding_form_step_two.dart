import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../widgets/custom_formbuilder_textfield.dart';

class BuyerOnBoardingStepTwo extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  BuyerOnBoardingStepTwo({super.key, required this.formKey});

  @override
  State<BuyerOnBoardingStepTwo> createState() => _BuyerOnBoardingStepTwoState();
}

class _BuyerOnBoardingStepTwoState extends State<BuyerOnBoardingStepTwo> {
  String dropdownvalue = 'Matriculation';
  var cities = ["Matriculation", "Intermediate", "Graduate", "Masters", "PHD"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Qualification",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: cities.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
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

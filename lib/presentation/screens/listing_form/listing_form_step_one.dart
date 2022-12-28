import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/screens/listing_form/local_widgets/custom_switch.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_form_builder_dropdown.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:ascension_mobile_app/presentation/widgets/selection_list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ListingFormStepOne extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const ListingFormStepOne({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ListingFieldTitleWithInfo(
            title: "Basic Info",
          ),
          const SizedBox(height: 16),
          CustomFormBuilderTextField(
              name: "title",
              focusNode: FocusNode(),
              controller: TextEditingController(),
              labelText: "Title",
              validators: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.max(25),
              ])),
          const SizedBox(height: 16),
          CustomFormBuilderTextField(
            name: "headline",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Headline",
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.max(25),
            ]),
          ),
          const SizedBox(height: 54),
          const ListingFieldTitleWithInfo(
            title: "Listing Nature",
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomFormBuilderTextField(
                  name: 'is_auctioned',
                  controller: TextEditingController(),
                  labelText: 'Auction this listing?',
                  validators: (p0) {
                    return null;
                  }, //  FormBuilderValidators.required(),
                  readOnly: true,
                ),
              ),
              const CustomSwitch(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomFormBuilderTextField(
                  name: 'is_established',
                  controller: TextEditingController(),
                  labelText: 'Is the listing established?',
                  validators: (p0) {
                    return null;
                  }, //FormBuilderValidators.required(),
                  readOnly: true,
                ),
              ),
              const CustomSwitch(),
            ],
          ),
          const SizedBox(height: 16),
          CustomFormBuilderDropDown(
            holdVal: true,
            name: "location",
            labelText: "Location",
            validators: (p0) {
              return null; //TODO : change this...
            }, // FormBuilderValidators.required(),
            child: const ListScreen(
              selectableType: City,
              type: FormListType.staticList,
              title: "Location",
            ),
          )
        ],
      ),
    );
  }
}

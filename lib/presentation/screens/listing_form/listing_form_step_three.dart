import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_dropdown.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:ascension_mobile_app/presentation/widgets/selection_list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ListingFormStepThree extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const ListingFormStepThree({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ListingFieldTitleWithInfo(
            title: "Industry",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderDropDown(
            holdVal: true,
            name: "industry",
            labelText: "Industry",
            child: const ListScreen(
              selectableType: Industry,
              type: FormListType.staticList,
              title: "Industry",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const ListingFieldTitleWithInfo(
            title: "Business Value",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderTextField(
            name: "askingPrice",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Asking Price",
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              //FormBuilderValidators.maxLength(8),
            ]),
            prefixIcon: const Icon(Icons.attach_money_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderTextField(
            name: "netIncome",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Net Income",
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              //FormBuilderValidators.maxLength(8),
            ]),
            prefixIcon: const Icon(Icons.attach_money_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderTextField(
            name: "cashFlow",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Cash Flow",
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              //FormBuilderValidators.maxLength(8),
            ]),
            prefixIcon: const Icon(Icons.attach_money_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderTextField(
            name: "grossRevenue",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Gross Revenue",
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              //FormBuilderValidators.maxLength(8),
            ]),
            prefixIcon: const Icon(Icons.attach_money_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderTextField(
            name: "inventoryPrice",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Inventory Price",
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.compose([
              //FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              //FormBuilderValidators.maxLength(8),
            ]),
            prefixIcon: const Icon(Icons.attach_money_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormBuilderTextField(
            name: "ebitda",
            focusNode: FocusNode(),
            controller: TextEditingController(),
            labelText: "Ebitda",
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.compose([
              //FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              //FormBuilderValidators.maxLength(8),
            ]),
            prefixIcon: const Icon(Icons.attach_money_sharp),
          ),
        ],
      ),
    );
  }
}

import 'package:ascension_mobile_app/business_logic/blocs/listing/edit_listing/edit_listing_bloc.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_dropdown.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:ascension_mobile_app/presentation/widgets/selection_list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditListingFormStepFour extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const EditListingFormStepFour({
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
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderDropDown(
                holdVal: true,
                initialValue: Industry(label: state.listing.industry),
                name: "industry",
                labelText: "Industry",
                child: const ListScreen(
                  selectableType: Industry,
                  type: FormListType.staticList,
                  title: "Industry",
                ),
              );
            },
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
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderTextField(
                name: "askingPrice",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text: state.listing.askingPrice.toString(),
                ),
                labelText: 'Asking Price',
                keyboardType: TextInputType.number,
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  //FormBuilderValidators.maxLength(8),
                ]),
                prefixIcon: const Icon(Icons.attach_money_sharp),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderTextField(
                name: "netIncome",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text: state.listing.netIncome.toString(),
                ),
                labelText: "Net Income",
                keyboardType: TextInputType.number,
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  //FormBuilderValidators.maxLength(8),
                ]),
                prefixIcon: const Icon(Icons.attach_money_sharp),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderTextField(
                name: "cashFlow",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text: state.listing.cashFlow.toString(),
                ),
                labelText: "Cash Flow",
                keyboardType: TextInputType.number,
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  //FormBuilderValidators.maxLength(8),
                ]),
                prefixIcon: const Icon(Icons.attach_money_sharp),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderTextField(
                name: "grossRevenue",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text: state.listing.grossRevenue.toString(),
                ),
                labelText: "Gross Revenue",
                keyboardType: TextInputType.number,
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  //FormBuilderValidators.maxLength(8),
                ]),
                prefixIcon: const Icon(Icons.attach_money_sharp),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderTextField(
                name: "inventoryPrice",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text: state.listing.inventoryPrice.toString(),
                ),
                labelText: "Inventory Price",
                keyboardType: TextInputType.number,
                validators: FormBuilderValidators.compose([
                  //FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  //FormBuilderValidators.maxLength(8),
                ]),
                prefixIcon: const Icon(Icons.attach_money_sharp),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

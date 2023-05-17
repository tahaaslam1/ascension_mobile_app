import 'package:ascension_mobile_app/business_logic/blocs/listing/edit_listing/edit_listing_bloc.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditListingFormStepTwo extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const EditListingFormStepTwo({
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
            title: "Description",
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 300,
            child: BlocBuilder<EditListingBloc, EditListingState>(
              builder: (context, state) {
                return CustomFormBuilderTextField(
                  name: "description",
                  focusNode: FocusNode(),
                  controller: TextEditingController(text: state.listing.description),
                  keyboardType: TextInputType.multiline,
                  labelText: "Describe the business in detail...",
                  expands: true,
                  validators: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(250),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListingFieldTitleWithInfo(
            title: "Reason for selling",
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 200,
            child: BlocBuilder<EditListingBloc, EditListingState>(
              builder: (context, state) {
                return CustomFormBuilderTextField(
                  name: "reasonForSelling",
                  focusNode: FocusNode(),
                  controller: TextEditingController(text: state.listing.reasonForSelling),
                  keyboardType: TextInputType.multiline,
                  labelText: "Provide reason for selling the bussiness...",
                  expands: true,
                  validators: FormBuilderValidators.compose(
                    [FormBuilderValidators.required(), FormBuilderValidators.max(150)],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ascension_mobile_app/business_logic/blocs/listing/edit_listing/edit_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/listing_form_flow_screen/switch_cubit/listing_switch_cubit.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_dropdown.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:ascension_mobile_app/presentation/widgets/selection_list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditListingFormStepOne extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const EditListingFormStepOne({
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
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              return CustomFormBuilderTextField(
                name: "title",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text: state.listing.title,
                ),
                labelText: "Title",
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.max(25),
                ]),
              );
            },
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
                  name: 'isAuctioned',
                  controller: TextEditingController(),
                  labelText: 'Auction this listing?',
                  validators: (p0) {
                    return null;
                  },
                  readOnly: true,
                ),
              ),
              BlocBuilder<EditListingBloc, EditListingState>(
                builder: (context, state) {
                  return Switch(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: state.listing.isAuctioned,
                    onChanged: ((value) {
                      BlocProvider.of<EditListingBloc>(context, listen: false).add(UpdateIsAuctioned(isAuctioned: value));
                    }),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomFormBuilderTextField(
                  name: 'isEstablished',
                  controller: TextEditingController(),
                  labelText: 'Is the listing established?',
                  validators: (p0) {
                    return null;
                  },
                  readOnly: true,
                ),
              ),
              BlocBuilder<EditListingBloc, EditListingState>(
                builder: (context, state) {
                  return Switch(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: state.listing.isEstablished,
                    onChanged: ((value) {
                      BlocProvider.of<EditListingBloc>(context, listen: false).add(UpdateIsEstablished(isEstablished: value));
                    }),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 60),
          BlocBuilder<EditListingBloc, EditListingState>(
            builder: (context, state) {
              // print(state.listing.city);
              return CustomFormBuilderDropDown(
                initialValue: City(label: state.listing.city),
                holdVal: true,
                name: "city",
                labelText: "Location",
                validators: (Selectable? value) {
                  return null;
                },
                child: const ListScreen(
                  selectableType: City,
                  type: FormListType.staticList,
                  title: "Location",
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

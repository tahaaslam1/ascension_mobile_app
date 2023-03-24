import 'package:ascension_mobile_app/presentation/widgets/anchored_single_child_scroll_view.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditSingleListingScreen extends StatefulWidget {
  static const String route = 'edit-listing-screen';

  const EditSingleListingScreen({Key? key}) : super(key: key);

  @override
  State<EditSingleListingScreen> createState() => _EditSingleListingScreenState();
}

class _EditSingleListingScreenState extends State<EditSingleListingScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: CustomAppBarAndBody(
            title: 'Edit Listing',
            showBackButton: true,
            body: AnchoredSingleChildScrollView(
              childPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              anchorPadding: const EdgeInsets.all(20),
              anchorElevation: Styles.elevation2,
              anchor: CustomElevatedButton(
                buttonText: 'Update',
                onPressed: () {
                  // if (_formKey.currentState!.saveAndValidate()) {
                  //   logger.i(_formKey.currentState!.value);

                  // }
                },
              ),
              child: FormBuilder(
                autoFocusOnValidationFailure: false,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "business title",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "business title",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Price",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "asking price",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "asking price",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                          (val) {
                            final number = int.tryParse(val!);
                            if (number == null) return null;
                            if (number < 0) return 'We cannot have a negative price';
                            return null;
                          }
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Revenue",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "Gross revenue",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "Gross revenue",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "business title",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "business title",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "EBITDA",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "ebitda",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "ebitda",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "FF&E",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "FF&E",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "FF&E",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Established",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "established year",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "established year",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "business description",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "business description",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Information",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 200,
                      child: CustomFormBuilderTextField(
                        expands: true,
                        name: "detailed information about your buiness",
                        formKey: _formKey,
                        focusNode: FocusNode(),
                        controller: TextEditingController(),
                        labelText: "detailed information about your business",
                        validators: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "number of Staff",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "staff",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "staff",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                          (val) {
                            final number = int.tryParse(val!);
                            if (number == null) return null;
                            if (number < 0) return 'We cannot have a negative age';
                            return null;
                          }
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Facilities",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "what facilities you provide",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "facilities",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Reason",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "reason for selling",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "reason for selling",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BIDS",
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Switch(value: false, onChanged: (bool value) {})
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

import 'package:ascension_mobile_app/logger.dart';
// import 'package:ascension_mobile_app/models/location.dart';
// import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/widgets/anchored_single_child_scroll_view.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
// import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_dropdown.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
// import 'package:ascension_mobile_app/presentation/widgets/selection_list_screen/list_screen.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditProfileScreen extends StatelessWidget {
  static const String route = 'edit-company-screen';
  final _formKey = GlobalKey<FormBuilderState>();
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: CustomAppBarAndBody(
            title: 'Edit Profile',
            showBackButton: true,
            body: AnchoredSingleChildScrollView(
              childPadding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              anchorPadding: const EdgeInsets.all(20),
              anchorElevation: Styles.elevation2,
              anchor: CustomElevatedButton(
                buttonText: 'Save',
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
                    Text(
                      "Bio",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 200,
                      child: CustomFormBuilderTextField(
                        name: "bio",
                        focusNode: FocusNode(),
                        formKey: _formKey,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.multiline,
                        labelText: "User bio...",
                        expands: true,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.max(250),
                          FormBuilderValidators.required()
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Username",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "Username",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: TextEditingController(),
                      labelText: "Username",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

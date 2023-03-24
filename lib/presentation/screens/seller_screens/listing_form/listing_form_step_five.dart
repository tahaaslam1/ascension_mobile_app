import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/local_widgets/add_assets_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ListingFormStepFive extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  final FocusNode experienceFocusNode = FocusNode();
  final Function(String) onAdd;
  final Function(String) onDelete;
  final List<String> assets;

  ListingFormStepFive({
    Key? key,
    required this.onAdd,
    required this.onDelete,
    required this.formKey,
    required this.assets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ListingFieldTitleWithInfo(
              title: "Assets Included",
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            AddAssetsButton(
              assets: assets,
              focusNode: experienceFocusNode,
              onAdd: (map) {
                onAdd(map);
              },
              onDelete: (map) {
                onDelete(map);
              },
            ),
          ],
        ));
  }
}

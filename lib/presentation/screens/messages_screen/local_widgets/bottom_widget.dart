import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BottomWidget extends StatelessWidget {
  final VoidCallback onPressed;
//  final GlobalKey<FormState> formKey;
  TextEditingController messageController;

  BottomWidget({
    required this.onPressed,
    required this.messageController,
    Key? key,
    // required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: Styles.elevation1,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
      child: Row(
        children: [
          Expanded(
            child:

                //   CustomFormBuilderTextField(
                //   name: "message",
                //   focusNode: FocusNode(),
                //   controller: TextEditingController(),
                //   labelText: 'Type somthing...',
                //   validators: (p0) {
                //     return null;
                //   },
                // )
                TextFormField(
              focusNode: FocusNode(),
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type something.',
                hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
              },
            ),
          ),
          Container(
            height: 48,
            width: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: Styles.elevation1,
            ),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

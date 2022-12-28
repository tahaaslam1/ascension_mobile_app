import 'package:ascension_mobile_app/presentation/widgets/full_screen_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class CustomFormBuilderDropDown extends StatelessWidget {
  final String name;
  final String labelText;
  final Widget child;
  final String? Function(String?)? validators;
  final TextEditingController _controller = TextEditingController();
  final bool invertColors;
  final bool forSkills;
  final void Function(String)? onSkillAdd;
  final bool holdVal;

  CustomFormBuilderDropDown({
    Key? key,
    required this.name,
    required this.labelText,
    required this.child,
    this.holdVal = false,
    this.invertColors = false,
    this.forSkills = false,
    this.onSkillAdd,
    this.validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (holdVal) if (FormBuilder.of(context)!.value.containsKey(name)) _controller.text = FormBuilder.of(context)!.getRawValue(name).toString();
    return FormBuilderTextField(
      name: name,
      controller: _controller,
      readOnly: true,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: Colors.black,
          ),
      decoration: InputDecoration(
        hintText: labelText,
        suffixIcon: Iconify(
          Ic.round_arrow_drop_down,
          size: 8,
          color: Theme.of(context).colorScheme.primary,
        ),
        fillColor: invertColors ? Theme.of(context).colorScheme.background : null,
      ),
      validator: validators,
      onTap: () {
        if (forSkills) {
          fullScreenDialog(context, _controller, child, true, onSkillAdd);
          _controller.clear();
        } else {
          fullScreenDialog(context, _controller, child, false, null);
        }
      },
    );
  }
}

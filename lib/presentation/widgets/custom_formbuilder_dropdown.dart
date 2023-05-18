import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/widgets/full_screen_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class CustomFormBuilderDropDown extends StatelessWidget {
  final String name;
  final String labelText;
  final Widget child;
  final TextEditingController _controller = TextEditingController();
  final bool invertColors;
  final bool forIndustries2;
  final void Function(Industry2)? onIndustry2Add;
  final bool holdVal;
  String? Function(Selectable?)? validators;
  final Selectable? initialValue;

  CustomFormBuilderDropDown({
    Key? key,
    required this.name,
    required this.labelText,
    required this.child,
    this.holdVal = false,
    this.invertColors = false,
    this.forIndustries2 = false,
    this.onIndustry2Add,
    required this.validators,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<Selectable>(
      name: name,
      validator: validators, //FormBuilderValidators.required(),
      builder: (FormFieldState<Selectable> field) {
        return GestureDetector(
            onTap: () {
              if (forIndustries2) {
                fullScreenDialog(
                    context: context,
                    child: child,
                    forIndustries2: true,
                    onIndustry2Add: onIndustry2Add,
                    onSelectabeAdd: (selectable) {
                      field.didChange(selectable);
                      field.save();
                    });
                _controller.clear();
              } else {
                fullScreenDialog(
                    context: context,
                    child: child,
                    forIndustries2: false,
                    onIndustry2Add: null,
                    onSelectabeAdd: (selectable) {
                      field.didChange(selectable);
                      field.save();
                    });
              }
            },
            child: InputDecorator(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                isEmpty: field.value == null,
                decoration: InputDecoration(
                  hintText: labelText,
                  errorText: field.errorText,
                  suffixIcon: Iconify(
                    Ic.round_arrow_drop_down,
                    size: 8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  fillColor: invertColors ? Theme.of(context).colorScheme.background : null,
                ),
                child: Offstage(
                    offstage: field.value == null,
                    child: Text(
                      field.value?.label ?? '',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: invertColors ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.onBackground,
                          ),
                    ))));
      },
    );
  }
}

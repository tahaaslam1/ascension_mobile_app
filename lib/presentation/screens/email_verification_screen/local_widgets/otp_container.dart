import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class OTPcontainer extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final String? labelText;
  final TextInputType keyboardType;
  final String? Function(String?) validators;
  final bool expands;
  final int minLines;
  final int maxLines;
  final Widget? suffixWidget;
  final bool? isPassword;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;

  const OTPcontainer({
    Key? key,
    required this.name,
    required this.controller,
    this.labelText,
    required this.validators,
    this.keyboardType = TextInputType.text,
    this.expands = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.suffixWidget,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 48,
      decoration: BoxDecoration(
        boxShadow: Styles.elevation3,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: FormBuilderTextField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        name: name,
        controller: controller,
        keyboardType: keyboardType,
        expands: expands,
        minLines: expands ? null : minLines,
        maxLines: expands ? null : maxLines,
        readOnly: readOnly ?? false,
        textInputAction: textInputAction,
        onChanged: (String? value) {
          if (value?.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        maxLength: 1,
        onTap: onTap,
        decoration: InputDecoration(
          counterText: "",
          hintText: labelText,
          suffixIcon: suffixIcon,
          suffix: suffixWidget,
          prefixIcon: prefixIcon,
        ),
        validator: validators,
        obscureText: isPassword ?? false,
      ),
    );
  }
}

import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:flutter/material.dart';

void fullScreenDialog({required context, required Widget child, required bool forIndustries2, required void Function(Industry2)? onIndustry2Add, required void Function(Selectable) onSelectabeAdd}) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return child;
      }).then((value) {
    if (value != null) {
      if (value is Selectable) {
        logger.i(value);
        onSelectabeAdd(value);
      }
      if (forIndustries2 && value is Industry2) {
        onSelectabeAdd(value);
        onIndustry2Add!(value);
      }
    }
  });
}

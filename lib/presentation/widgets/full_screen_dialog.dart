import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:flutter/material.dart';

void fullScreenDialog({required context, required Widget child, required bool forSkills, required void Function(Skill)? onSkillAdd, required void Function(Selectable) onSelectabeAdd}) {
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
      if (forSkills && value is Skill) {
        onSelectabeAdd(value);
        onSkillAdd!(value);
      }
    }
  });
}

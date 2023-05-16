import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  static void showConfirmationSnackBar(BuildContext context, [String? text]) {
    showSnackBar(
      context,
      text ?? AppMessageService.genericSucessMessage,
      const Icon(Icons.check, color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      textColor: Colors.white,
    );
  }

  static void showWarningSnackBar(BuildContext context, [String? text]) {
    showSnackBar(context, text ?? AppMessageService.genericErrorMessage, const Icon(Icons.warning, color: Colors.yellow));
  }

  static void showGenericErrorSnackBar(BuildContext context, [String? text]) {
    showSnackBar(
      context,
      text ?? AppMessageService.genericErrorMessage,
      Icon(Icons.error_outline, color: Theme.of(context).colorScheme.background),
      textColor: Theme.of(context).colorScheme.background,
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }

  static void showSnackBar(BuildContext context, String text, Icon icon, {Color? backgroundColor, Color? textColor}) {
    if (text.isNotEmpty) {
      final SnackBar snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.background,
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 12),
            Flexible(child: Text(text, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: textColor ?? Theme.of(context).colorScheme.onBackground))),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

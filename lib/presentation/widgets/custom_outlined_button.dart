import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final String buttonText;

  const CustomOutlinedButton({Key? key, this.onPressed, this.onLongPress, this.isLoading = false, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
                strokeWidth: 3,
              ),
            )
          : Text(buttonText, style: Theme.of(context).textTheme.button?.copyWith(color: Theme.of(context).colorScheme.primary)),
    );
  }
}

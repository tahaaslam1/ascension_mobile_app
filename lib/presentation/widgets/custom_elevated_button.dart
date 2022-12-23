import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final String buttonText;
  final double width;
  final double height;

  const CustomElevatedButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.isLoading = false,
      this.height = 20,
      this.width = 20,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: width,
              height: height,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
                strokeWidth: 3,
              ),
            )
          : Text(buttonText,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Colors.white)),
    );
  }
}

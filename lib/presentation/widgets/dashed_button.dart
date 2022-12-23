import 'package:ascension_mobile_app/presentation/widgets/custom_dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedButton extends StatelessWidget {
  final double borderRadius;
  final double dashLineRadius;
  final Color color;
  final String buttonText;
  final VoidCallback onPressed;

  const DashedButton({
    Key? key,
    this.borderRadius = 16,
    this.dashLineRadius = 16,
    required this.color,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDottedBorder(
      strokeWidth: 1,
      borderType: BorderType.RRect,
      radius: Radius.circular(dashLineRadius),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: color,
        child: InkWell(
          onTap: onPressed,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent.withOpacity(0.1),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.button,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

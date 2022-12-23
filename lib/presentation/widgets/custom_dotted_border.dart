import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomDottedBorder extends StatelessWidget {
  final BorderType borderType;
  final Widget child;
  final Path Function(Size, Radius)? customPath;
  final Radius radius;
  final double strokeWidth;
  const CustomDottedBorder({
    Key? key,
    this.borderType = BorderType.Rect,
    required this.child,
    this.customPath,
    this.radius = const Radius.circular(20),
    this.strokeWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).colorScheme.onSecondary,
      strokeWidth: strokeWidth,
      radius: radius,
      dashPattern: const [5, 4],
      borderType: borderType,
      customPath:
          customPath == null ? null : (Size size) => customPath!(size, radius),
      child: child,
    );
  }
}

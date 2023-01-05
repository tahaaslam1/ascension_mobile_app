import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


import '../../styles.dart';
import 'custom_dotted_border.dart';

enum ButtonType { primary, secondary }

class CustomExtendedCard extends StatelessWidget {
  final double upperBoxHeight;
  final double lowerBoxHeight;
  final ButtonType buttonType;
  final Widget childTopCard;
  final Widget childBottomCard;
  const CustomExtendedCard({
    Key? key,
    this.buttonType = ButtonType.primary,
    required this.upperBoxHeight,   
    required this.lowerBoxHeight,
    required this.childTopCard,
    required this.childBottomCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration:
            BoxDecoration(boxShadow: Styles.elevation3, color: Colors.white, borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        height: upperBoxHeight,
        child: Padding(
          padding: const EdgeInsets.only(left : 12.0,top : 12.0),
          child: childTopCard,
        ),
      ),
      if (buttonType == ButtonType.primary)
        Container(
          decoration: BoxDecoration(
              boxShadow: Styles.elevation3,
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
          height: lowerBoxHeight,
          child: childBottomCard,
        ),
      if (buttonType == ButtonType.secondary)
        CustomDottedBorder(
          borderType: BorderType.RRect,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: Styles.elevation3,
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
            height: lowerBoxHeight,
            child: childBottomCard,
          ),
          customPath: (Size size, Radius radius) {
            return Path()
              ..addRRect(
                RRect.fromRectAndCorners(
                  Rect.fromLTWH(
                    0,
                    0,
                    size.width - 1,
                    size.height - 1,
                  ),
                  bottomRight: const Radius.circular(8),
                  bottomLeft: const Radius.circular(8),
                ),
              );
          },
        ),
    ]);
  }
}

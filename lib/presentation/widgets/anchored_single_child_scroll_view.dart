import 'package:flutter/material.dart';

class AnchoredSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final EdgeInsets childPadding;
  final EdgeInsets anchorPadding;
  final ScrollPhysics? physics;
  final Widget? anchor;
  final List<BoxShadow>? anchorElevation;

  const AnchoredSingleChildScrollView({
    Key? key,
    this.anchor,
    required this.child,
    this.childPadding = EdgeInsets.zero,
    this.anchorPadding = EdgeInsets.zero,
    this.physics,
    this.anchorElevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SingleChildScrollView(padding: childPadding, physics: physics, child: child)),
        if (anchor != null)
          Container(
            decoration: BoxDecoration(boxShadow: anchorElevation, color: Colors.white),
            width: double.infinity,
            child: Padding(padding: anchorPadding, child: SafeArea(top: false, child: anchor!)),
          ),
      ],
    );
  }
}

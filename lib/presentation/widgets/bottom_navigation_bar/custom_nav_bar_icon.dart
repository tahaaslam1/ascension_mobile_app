import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomBottomNavBarIcon extends StatelessWidget {
  final String iconName;
  final bool isActive;
  const CustomBottomNavBarIcon({
    Key? key,
    required this.iconName,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Iconify(
        iconName,
        color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
        size: 24.0,
      ),
    );
  }
}

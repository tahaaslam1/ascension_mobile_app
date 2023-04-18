import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SellerFAButton extends StatelessWidget {
  const SellerFAButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      elevation: 8.0,
      shape: const CircleBorder(),
      spaceBetweenChildren: 20,
      childrenButtonSize: const Size(64, 64),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.edit),
          backgroundColor: Theme.of(context).primaryColor,
          onTap: () {},
        ),
        SpeedDialChild(
          child: const Icon(Icons.delete),
          backgroundColor: Theme.of(context).colorScheme.onError,
          onTap: () {},
        ),
      ],
    );
  }
}

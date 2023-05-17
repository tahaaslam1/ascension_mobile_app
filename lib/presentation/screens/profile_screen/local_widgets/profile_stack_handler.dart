import 'package:ascension_mobile_app/presentation/screens/profile_screen/local_widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfileStackHandler extends StatelessWidget {
  final String? avatarUrl;
  final Widget child;

  const ProfileStackHandler({Key? key, required this.child, this.avatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 20,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer, width: 1),
              ),
              child: child,
            ),
            Positioned.fill(
              top: -64,
              child: Align(
                alignment: Alignment.topCenter,
                child: ProfileAvatar(
                  avatarUrl: avatarUrl,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

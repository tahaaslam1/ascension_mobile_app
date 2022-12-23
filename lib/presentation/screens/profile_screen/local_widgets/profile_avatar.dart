import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, this.avatarUrl}) : super(key: key);

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 148,
          width: 148,
          decoration: BoxDecoration(
            boxShadow: Styles.elevation2,
            shape: BoxShape.circle,
            color: Styles.mainTheme.colorScheme.primary.withAlpha(40),
          ),
        ),
        Container(
          height: 112,
          width: 112,
          decoration: BoxDecoration(
            boxShadow: Styles.elevation2,
            shape: BoxShape.circle,
            color: Styles.mainTheme.colorScheme.primary.withAlpha(40),
          ),
        ),
        Avatar(
          radius: 40.0,
          avatarUrl:
              "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
        ),
      ],
    );
  }
}

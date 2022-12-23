import 'package:dotted_border/dotted_border.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_dotted_border.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem(
      {Key? key,
      required this.menuIcon,
      required this.menuText,
      required this.isEditProfile,
      required this.onTap})
      : super(key: key);
  final bool isEditProfile;
  final Iconify menuIcon;
  final String menuText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (!isEditProfile) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 72.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            boxShadow: Styles.elevation2,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: menuIcon,
              ),
              Expanded(
                child: Text(
                  menuText,
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  //textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return CustomDottedBorder(
        borderType: BorderType.RRect,
        child: Container(
          height: 72.0,
          decoration: BoxDecoration(
            color: Colors.white, //Theme.of(context).colorScheme.secondary,
            boxShadow: Styles.elevation2,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: menuIcon,
              ),
              Expanded(
                child: Text(
                  menuText,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Iconify(
                  Ic.sharp_arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/et.dart';
//import 'package:iconify_flutter/icons/fluent.dart';

/// A widget that displays a circle avatar.
/// If the [avatarUrl] is null, it will display a default avatar.
enum AvatarType { company, user }
enum EmptyAvatarBorderType { none, dotted }

class Avatar extends StatelessWidget {
  final String? avatarUrl;
  final double radius;
  final double? minRadius;
  final double? maxRadius;
  final AvatarType avatarType;
  final EmptyAvatarBorderType emptyAvatarBorderType;

  /// A widget that displays a circle avatar.
  /// If the [avatarUrl] is null, it will display a default avatar.
  const Avatar(
      {Key? key, this.avatarUrl, this.radius = 24, this.minRadius, this.maxRadius, this.avatarType = AvatarType.user, this.emptyAvatarBorderType = EmptyAvatarBorderType.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (avatarUrl == null) {
      return _PlaceHolderAvatar(avatarType: avatarType, emptyAvatarBorderType: emptyAvatarBorderType, radius: radius);
    }
    return CachedNetworkImage(
      imageUrl: avatarUrl!,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        minRadius: minRadius,
        maxRadius: maxRadius,
        backgroundImage: imageProvider,
        backgroundColor: Colors.transparent,
      ),
      placeholder: (context, url) => _PlaceHolderAvatar(avatarType: avatarType, emptyAvatarBorderType: emptyAvatarBorderType, radius: radius),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class _PlaceHolderAvatar extends StatelessWidget {
  final AvatarType avatarType;
  final EmptyAvatarBorderType emptyAvatarBorderType;
  final double radius;

  const _PlaceHolderAvatar({Key? key, required this.avatarType, required this.emptyAvatarBorderType, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: const EdgeInsets.all(4),
      child: Transform.scale(
        scale: 0.8,
        child: Iconify(
          avatarType == AvatarType.user ? Et.profile_male : Et.adjustments,// Fluent.building_skyscraper_20_regular,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}

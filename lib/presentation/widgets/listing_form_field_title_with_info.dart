import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class ListingFieldTitleWithInfo extends StatelessWidget {
  final String title;
  final bool isOptional;
  const ListingFieldTitleWithInfo({Key? key, required this.title, this.isOptional = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            if (isOptional)
              Text(
                "Optional",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (isOptional) const SizedBox(width: 12),
            GestureDetector(
              onTap: () {},
              child: Iconify(
                Mdi.info_circle_outline,
                size: 20,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

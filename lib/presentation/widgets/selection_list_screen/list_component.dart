import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  final Selectable selectable;
  final VoidCallback? onSelectableAdd;

  const ListComponent({Key? key, required this.selectable, this.onSelectableAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (onSelectableAdd != null) onSelectableAdd!();
        context.router.popForced(selectable);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
        child: SizedBox(
          width: double.infinity,
          height: 32,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(selectable.label, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            Divider(
              height: 1,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          ]),
        ),
      ),
    );
  }
}

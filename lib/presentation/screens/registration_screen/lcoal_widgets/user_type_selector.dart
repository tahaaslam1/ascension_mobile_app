import 'package:flutter/material.dart';

class UserTypeSelector extends StatelessWidget {
  final List<BoxShadow> elevation;
  final Color bodycolor;
  final String imagePath;
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;

  const UserTypeSelector({Key? key, required this.bodycolor, required this.isSelected, required this.elevation, required this.imagePath, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: elevation,
          color: bodycolor,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                )
              : null,
        ),
        padding: const EdgeInsets.only(left: 40, right: 40, top: 32, bottom: 10),
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 8),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

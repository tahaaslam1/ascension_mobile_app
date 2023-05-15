import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final bool externalLink;
  const CustomChip({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    this.externalLink = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(19)),
        color: backgroundColor,
      ),
      child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (externalLink) ...[
                const Icon(
                  Icons.open_in_new,
                  size: 16,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.overline?.copyWith(color: foregroundColor),
                ),
              ),
            ],
          )),
    );
  }
}
import 'package:ascension_mobile_app/presentation/widgets/custom_chip.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class CustomChipDynamicIndustry extends StatelessWidget {
  final String name;
  final VoidCallback onDelete;

  const CustomChipDynamicIndustry({
    Key? key,
    required this.name,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              CustomChip(backgroundColor: Theme.of(context).colorScheme.secondary, foregroundColor: Theme.of(context).colorScheme.primary, text: name),
            ],
          ),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: Styles.containerStyle.copyWith(borderRadius: BorderRadius.circular(100), color: Theme.of(context).colorScheme.error),
              child: SizedBox(
                height: 8,
                width: 8,
                child: Iconify(
                  Ic.baseline_close,
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

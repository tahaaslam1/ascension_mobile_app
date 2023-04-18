import 'package:ascension_mobile_app/presentation/widgets/custom_dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class CreateListingButton extends StatelessWidget {
  const CreateListingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDottedBorder(
      borderType: BorderType.RRect,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 28, bottom: 22.82),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Iconify(
                  Mdi.plus_circle_outline,
                  size: 56,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 9.8),
                Text('Create a Listing', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

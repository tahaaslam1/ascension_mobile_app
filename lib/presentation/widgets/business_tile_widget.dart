import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BusinessTileWidget extends StatelessWidget {
  final String askingPrice;
  final String businessDescription;
  final String businessLocation;
  final String businessTitle;
  final String businessImageUrl;
  final Function()? onTap;

  const BusinessTileWidget({
    Key? key,
    required this.askingPrice,
    required this.businessDescription,
    required this.businessLocation,
    required this.businessTitle,
    required this.businessImageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 6.0,
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: businessImageUrl,
                      fit: BoxFit.fill,
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, bottom: 10.0, right: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${businessTitle.substring(0, businessTitle.length ~/ 3)}...',
                                style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 12,
                            ),
                            Text(
                              businessLocation,
                              style: Theme.of(context).textTheme.overline!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              businessDescription,
                              style: Theme.of(context).textTheme.overline!.copyWith(overflow: TextOverflow.fade, color: Theme.of(context).colorScheme.onSurface),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('Rs.$askingPrice', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

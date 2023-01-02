import 'package:flutter/material.dart';

class ListingPriceDetails extends StatelessWidget {
  final String title;
  final String info;
  const ListingPriceDetails({
    required this.title,
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            info,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

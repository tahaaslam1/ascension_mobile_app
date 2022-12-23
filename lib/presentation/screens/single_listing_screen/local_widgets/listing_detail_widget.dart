
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListingDetail extends StatelessWidget {
  String title;
  String info;
  ListingDetail({
    required this.title,
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: Theme.of(context).textTheme.headline5),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            info,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}

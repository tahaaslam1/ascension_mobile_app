import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/pulsating_button.dart';

class BidTile extends StatelessWidget {
  String image;
  String name;
  String dateTime;
  String connect;
  BidTile({
    required this.image,
    required this.name,
    required this.connect,
    required this.dateTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70.0),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.fill,
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: Theme.of(context).textTheme.headline6),
                      Text(dateTime,
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(connect,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  PulsatingButton(
                    primaryColor: Theme.of(context).colorScheme.primary,
                    secondaryColor: Theme.of(context).colorScheme.secondary,
                    discRadius: 30,
                    animationRadius: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

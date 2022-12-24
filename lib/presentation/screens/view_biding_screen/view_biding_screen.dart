import 'package:ascension_mobile_app/presentation/widgets/pulsating_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'local_widget/bid_tile_widget.dart';

class ViewBidingScreen extends StatelessWidget {
  static const route = 'view-biding-screen';
  const ViewBidingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Bids on Title", // yahan business title aye ga
                    style: Theme.of(context).textTheme.headline3),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return BidTile(
                      name: "Hunain Arif",
                      dateTime: "Nov 15, 2021 at 7:00",
                      image:
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                      connect: "2.47ETH",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

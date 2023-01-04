import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';

class FavouriteListingScreen extends StatelessWidget {
  static const String route = 'favourite-listing-screen';
  const FavouriteListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        title: "Your Favourites",
        showBackButton: true,
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return const BusinessTileWidget(
                  askingPrice: "50000",
                  businessDescription: "businessDescription",
                  businessLocation: "businessLocation",
                  businessTitle: " businessTitle",
                  businessImageUrl:
                      "https://etimg.etb2bimg.com/photo/76159933.cms");
            }),
      ),
    );
  }
}

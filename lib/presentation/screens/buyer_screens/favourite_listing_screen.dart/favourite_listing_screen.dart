import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/cubits/favourite/favourite_cubit.dart';
import '../../../../routes/router.gr.dart';

class FavouriteListingScreen extends StatefulWidget {
  static const String route = 'favourite-listing-screen';
  const FavouriteListingScreen({super.key});

  @override
  State<FavouriteListingScreen> createState() => _FavouriteListingScreenState();
}

class _FavouriteListingScreenState extends State<FavouriteListingScreen> {
  @override
  void initState() {
    BlocProvider.of<FavouriteCubit>(context, listen: false).loadFavListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        title: "Favourite Listings",
        showBackButton: true,
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            switch (state.favouriteStatus) {
              case FavouriteStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case FavouriteStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case FavouriteStatus.error:
                return const Center(child: Text('Error fetching favourite listings'));
              case FavouriteStatus.loaded:
                if (state.favouriteListings.isEmpty) {
                  return const Center(child: Text('No Favorite Listings'));
                } else {
                  return ListView.builder(
                    itemCount: state.favouriteListings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BusinessTileWidget(
                        askingPrice: '${state.favouriteListings[index].askingPrice}',
                        businessDescription: state.favouriteListings[index].description.toString(),
                        businessLocation: state.favouriteListings[index].city.toString(),
                        businessTitle: state.favouriteListings[index].title.toString(),
                        businessImageUrl: state.favouriteListings[index].images.first.toString(),
                        onTap: () {
                          context.router.push(SingleListingRoute(
                            listingId: state.favouriteListings[index].listingId,
                            industry: state.favouriteListings[index].industry,
                          ));
                        },
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

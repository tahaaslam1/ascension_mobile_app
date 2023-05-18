import 'package:ascension_mobile_app/business_logic/blocs/listing/get_seller_listing/get_seller_listing_bloc.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_screen/local_widgets/create_listing_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';

class ListingScreen extends StatelessWidget {
  static const route = 'listing-screen';
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomAppBarAndBody(
          title: 'Businesses',
          showBackButton: false,
          body: RefreshIndicator(
            onRefresh: () {
              context.read<GetSellerListingBloc>().add(FetchSellerListing());
              return Future.value();
            },
            child: BlocBuilder<GetSellerListingBloc, GetSellerListingState>(
              builder: (context, state) {
                if (state is GetSellerListingInitial) {
                  return const Center(child: SingleChildScrollView(primary: true, child: Center(child: CircularProgressIndicator())));
                } else if (state is GetSellerListingError) {
                  return Center(
                    child: SingleChildScrollView(
                      primary: true,
                      child: Center(child: Text(state.errorMessage)),
                    ),
                  );
                } else if (state is GetSellerListingLoaded) {
                  return state.sellerListings.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: () {
                            context.read<GetSellerListingBloc>().add(FetchSellerListing());
                            return Future.value();
                          },
                          child: SingleChildScrollView(
                            primary: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.router.push(ListingFormFlowRoute());
                                    },
                                    child: const CreateListingButton(),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.sellerListings.length,
                                  itemBuilder: (context, index) {
                                    return BusinessTileWidget(
                                      askingPrice: '${state.sellerListings[index].askingPrice}',
                                      businessDescription: state.sellerListings[index].description.toString(),
                                      businessLocation: state.sellerListings[index].city.toString(),
                                      businessTitle: state.sellerListings[index].title.toString(),
                                      businessImageUrl: state.sellerListings[index].images.first.toString(),
                                      onTap: () {
                                        context.router.push(SingleListingRoute(
                                          listingId: state.sellerListings[index].listingId,
                                          industry: state.sellerListings[index].industry,
                                        ));
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: RefreshIndicator(
                            onRefresh: () {
                              context.read<GetSellerListingBloc>().add(FetchSellerListing());
                              return Future.value();
                            },
                            child: SingleChildScrollView(
                              primary: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset('assets/images/no_listing.png', height: MediaQuery.of(context).size.height * 0.5, width: MediaQuery.of(context).size.width * 0.5),
                                  ),
                                  Center(child: Text('You have not created any listing yet', style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurface), textAlign: TextAlign.center)),
                                  const SizedBox(height: 12),
                                  Center(child: Text('Click on the button below to create your first listing', style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Theme.of(context).colorScheme.onSurface), textAlign: TextAlign.center)),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.router.push(ListingFormFlowRoute());
                                      },
                                      child: const CreateListingButton(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

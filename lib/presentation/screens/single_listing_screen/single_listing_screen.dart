import 'package:ascension_mobile_app/business_logic/blocs/listing/get_recommended_listing_bloc/get_recommended_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/get_single_listing_bloc/get_single_listing_bloc.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_widgets/listing_detail_widget.dart';
import 'local_widgets/listing_price_detail_widget.dart';

class SingleListingScreen extends StatefulWidget {
  final String listingId;
  final String? industry;
  static const route = 'single-lising-screen';
  const SingleListingScreen({super.key, required this.listingId, required this.industry});

  @override
  State<SingleListingScreen> createState() => _SingleListingScreenState();
}

class _SingleListingScreenState extends State<SingleListingScreen> {
  late GetSingleListingBloc _getSingleListingBloc;
  late GetRecommendedListingBloc _getRecommendedListingBloc;

  @override
  void initState() {
    _getSingleListingBloc = BlocProvider.of<GetSingleListingBloc>(context);
    _getSingleListingBloc.add(FetchSingleListing(listingId: widget.listingId));

    _getRecommendedListingBloc = BlocProvider.of<GetRecommendedListingBloc>(context);
    _getRecommendedListingBloc.add(FetchSingleRecommendedListing(industry: widget.industry));
    super.initState();
  }

  final List<String> imageList = [
    "images/hall1.jpg",
    "images/hall4.jpg",
    "images/hall3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetSingleListingBloc, GetSingleListingState>(
          builder: (context, state) {
            if (state is GetSingleListingLoading) {
              return const CustomAppBarAndBody(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
                title: '',
                showBackButton: true,
              );
            } else if (state is GetSingleListingError) {
              return CustomAppBarAndBody(
                body: Center(
                  child: Text(state.errorMessage),
                ),
                title: '',
                showBackButton: true,
              );
            } else if (state is GetSingleListingLoaded) {
              return CustomAppBarAndBody(
                title: "",
                showBackButton: true,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${state.listing.title}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 15,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${state.listing.country}",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                          ),
                          items: imageList
                              .map((e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      SizedBox(
                                        height: 140,
                                        width: 168,
                                        child: Image.network(
                                          "https://assets3.thrillist.com/v1/image/2676503/2880x1620/crop;webp=auto;jpeg_quality=60;progressive.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                        // color: Colors.grey,
                                      ),
                                    ],
                                  )))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      state.listing.isAuctioned
                          ? Center(
                              // TODO : check if is_auctioned true...
                              child: SizedBox(
                                width: 400,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: Theme.of(context).elevatedButtonTheme.style,
                                  child: const Text(
                                    "Bid On This Business",
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 30),
                      ListingPriceDetails(title: "Asking Price", info: "${state.listing.askingPrice}"),
                      ListingPriceDetails(title: "Gross Revenue", info: "${state.listing.grossRevenue}"),
                      ListingPriceDetails(title: "Cash Flow", info: "${state.listing.cashFlow}"),
                      ListingPriceDetails(title: "Inventory Price", info: "${state.listing.inventoryPrice}"),
                      ListingPriceDetails(title: "Net Income", info: "${state.listing.netIncome}"),
                      // if(state.listing.isEstablished != null){
                      ListingPriceDetails(title: "Established", info: state.listing.isEstablished ? "Yes" : "No"),

                      //  },
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.primary)),
                                child: TextButton(
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.primary)),
                                child: TextButton(
                                  child: const Text(
                                    "Chat",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandablePanel(
                          header: Text(
                            'Business Description:',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          // ignore: unnecessary_string_interpolations
                          collapsed: Text('${state.listing.description!.substring(0, (state.listing.description!.length / 2).toInt())}'),
                          expanded: Text('${state.listing.description}'),
                          theme: const ExpandableThemeData(hasIcon: false, tapBodyToExpand: true, tapHeaderToExpand: true),
                        ),
                      ),
                      ListingDetail(
                        title: "Industry:",
                        info: "${state.listing.industry}",
                      ),
                      ListingDetail(
                        title: "Reason For Selling:",
                        info: "${state.listing.reasonForSelling}",
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Assets included:',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          state.listing.assetsIncluded!.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.listing.assetsIncluded!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.circle, size: 8.0),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              state.listing.assetsIncluded![index],
                                              style: Theme.of(context).textTheme.subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox()
                        ],
                      ),
                      // const ListingDetail(
                      //   title: "Assets included",
                      //   info: "Info",
                      // ),
                      // const ListingDetail(
                      //   title: "Opportunities",
                      //   info: "3",
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Opportunities:',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          state.listing.opportunities!.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.listing.opportunities!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.circle, size: 8.0),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              state.listing.opportunities![index],
                                              style: Theme.of(context).textTheme.subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Risks:',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          state.listing.risks!.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.listing.risks!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.circle, size: 8.0),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              state.listing.risks![index],
                                              style: Theme.of(context).textTheme.subtitle1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "SIMILAR BUSINESSES:",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      BlocBuilder<GetRecommendedListingBloc, GetRecommendedListingState>(
                        builder: (context, state) {
                          if (state is GetRecommendedListingLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GetRecommendedListingLoaded) {
                            return SizedBox(
                              height: 200.0,
                              child: ListView.builder(
                                itemCount: state.listings.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return BusinessTileWidget(
                                    askingPrice: '${state.listings[index].askingPrice}',
                                    businessDescription: state.listings[index].description.toString(),
                                    businessLocation: state.listings[index].country.toString(),
                                    businessTitle: state.listings[index].title.toString(),
                                    businessImageUrl: state.listings[index].imageUrl.toString(),
                                    onTap: () {
                                      context.router.push(SingleListingRoute(listingId: state.listings[index].listingId, industry: state.listings[index].industry));
                                    },
                                  );
                                },
                              ),
                            );
                          } else if (state is GetRecommendedListingError) {
                            return Center(
                              child: Text(state.errorMessage),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const CustomAppBarAndBody(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
                title: '',
                showBackButton: true,
              );
            }
          },
        ),
      ),
    );
  }
}

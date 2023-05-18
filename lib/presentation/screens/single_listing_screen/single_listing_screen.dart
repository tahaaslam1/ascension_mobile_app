import 'package:ascension_mobile_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/get_recommended_listing_bloc/get_recommended_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/message/inbox_bloc/inbox_bloc.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/local_widgets/custom_button.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/local_widgets/listing_images_widget.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/local_widgets/seller_fa_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/listing/get_seller_listing/get_seller_listing_bloc.dart';
import '../../../business_logic/blocs/listing/single_listing_bloc/single_listing_bloc.dart';
import '../../../logger.dart';
import '../../../services/snack_bar_service.dart';
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
  late SingleListingBloc _singleListingBloc;
  late GetRecommendedListingBloc _getRecommendedListingBloc;

  @override
  void initState() {
    _singleListingBloc = BlocProvider.of<SingleListingBloc>(context);
    _singleListingBloc.add(FetchSingleListing(listingId: widget.listingId));

    _getRecommendedListingBloc = BlocProvider.of<GetRecommendedListingBloc>(context);
    _getRecommendedListingBloc.add(FetchSingleRecommendedListing(industry: widget.industry));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingleListingBloc, SingleListingState>(
      listener: (context, state) {
        if (state.deleteSingleListingStatus == DeleteSingleListingStatus.deleted) {
          BlocProvider.of<GetSellerListingBloc>(context).add(FetchSellerListing());

          SnackBarService.showConfirmationSnackBar(context);
          context.router.pop();
        } else if (state.deleteSingleListingStatus == DeleteSingleListingStatus.error) {
          SnackBarService.showGenericErrorSnackBar(context);
        }
      },
      builder: (context, state) {
        if (state.getSingleListingStatus == GetSingleListingStatus.loading || state.deleteSingleListingStatus == DeleteSingleListingStatus.loading) {
          return const Scaffold(
            body: SafeArea(
              child: CustomAppBarAndBody(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
                title: '',
                showBackButton: true,
              ),
            ),
          );
        } else if (state.getSingleListingStatus == GetSingleListingStatus.error) {
          return Scaffold(
            body: SafeArea(
              child: CustomAppBarAndBody(
                body: RefreshIndicator(
                  onRefresh: () {
                    BlocProvider.of<SingleListingBloc>(context).add(const FetchSingleListing(listingId: ''));
                    return Future.value();
                  },
                  child: const Center(
                    child: Text('Something went wrong'),
                  ),
                ),
                title: '',
                showBackButton: true,
              ),
            ),
          );
        } else if (state.getSingleListingStatus == GetSingleListingStatus.loaded) {
          return Scaffold(
            floatingActionButton: BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.seller
                ? SellerFAButton(
                    listingId: widget.listingId,
                    singleListingBloc: _singleListingBloc,
                    onDelete: () {
                      deleteListingDialog(context);
                    },
                    onEdit: () {
                      context.router.push(EditListingFormFlowRoute(listing: state.listing));
                    },
                  )
                : const SizedBox(),
            body: SafeArea(
              child: CustomAppBarAndBody(
                title: "",
                showBackButton: true,
                body: RefreshIndicator(
                  onRefresh: () {
                    BlocProvider.of<SingleListingBloc>(context).add(FetchSingleListing(listingId: widget.listingId));
                    return Future.value();
                  },
                  child: SingleChildScrollView(
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
                                state.listing.city,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),

                      ),
                      const SizedBox(height: 20),
                      ListingImagesWidget(
                        images: state.listing.images,
                      ),
                      const SizedBox(height: 30),
                      state.listing.isAuctioned == true && BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.buyer
                          ? CustomButton(
                              text: "Bid On This Business",
                              onPressed: () {
                                context.router.push(PlacingBidRoute(
                                    listingId: widget.listingId,
                                    askingPrice: state.listing.askingPrice.toString(),
                                    images: state.listing.images,
                                    listingTitle: state.listing.title!));
                              },
                            )
                          : state.listing.isAuctioned == true && BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.seller
                              ? CustomButton(
                                  text: "View all bids on this business",
                                  onPressed: () {
                                    context.router.push(ViewBidingRoute(listingId: widget.listingId, listingTitle: state.listing.title!));
                                  },
                                )
                              : const SizedBox(),
                      const SizedBox(height: 30),
                      ListingPriceDetails(title: "Asking Price", info: "${state.listing.askingPrice}"),
                      ListingPriceDetails(title: "Gross Revenue", info: "${state.listing.grossRevenue}"),
                      ListingPriceDetails(title: "Cash Flow", info: "${state.listing.cashFlow}"),
                      ListingPriceDetails(title: "Inventory Price", info: "${state.listing.inventoryPrice}"),
                      ListingPriceDetails(title: "Net Income", info: "${state.listing.netIncome}"),
                      ListingPriceDetails(title: "Established", info: state.listing.isEstablished ? "Yes" : "No"),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.buyer
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        decoration: state.isFav == true
                                            ? BoxDecoration(
                                                border: Border.all(color: Theme.of(context).colorScheme.primary),
                                                color: Theme.of(context).colorScheme.secondary)
                                            : BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.primary)),
                                        child: TextButton(
                                          child: const Text(
                                            "Save",
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),

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
                                            onPressed: () {
                                              logger.d('seller id');
                                              logger.d(state.listing.seller);
                                              context.read<InboxBloc>().add(BuyerCreateInbox(
                                                  listingId: state.listing.listingId,
                                                  sellerId: state.listing.seller ?? '-',
                                                  title: state.listing.title ?? '-',
                                                  inboxCreate: (String firstName, String lastName) {
                                                    context.router.push(ChatRoute(
                                                      recipientId: state.listing.seller ?? '-',
                                                      recipientFirstName: firstName,
                                                      recipientLastName: lastName,
                                                      listingTitle: state.listing.title ?? '-',
                                                      listingId: state.listing.listingId,
                                                    ));
                                                  },
                                                  inboxExits: (String firstName, String lastName) {
                                                    context.router.push(ChatRoute(
                                                      recipientId: state.listing.seller ?? '-',
                                                      recipientFirstName: firstName,
                                                      recipientLastName: lastName,
                                                      listingTitle: state.listing.title ?? '-',
                                                      listingId: state.listing.listingId,
                                                    ));
                                                  },
                                                  onError: () {
                                                    SnackBarService.showGenericErrorSnackBar(context);
                                                  }));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox() // TODO Add View  Milstones button if any milestones exists for a listing,
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
                            collapsed: Text(state.listing.description!.substring(0, state.listing.description!.length ~/ 2)),
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
                            state.listing.assetsIncluded!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Assets included:',
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                  )
                                : const SizedBox(),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.listing.opportunities!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Opportunities:',
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                  )
                                : const SizedBox(),
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
                            state.listing.risks!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Risks:',
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                  )
                                : const SizedBox(),
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
                              return state.listings.isNotEmpty
                                  ? SizedBox(
                                      height: 200.0,
                                      child: ListView.builder(
                                        itemCount: state.listings.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context, int index) {
                                          return BusinessTileWidget(
                                            askingPrice: '${state.listings[index].askingPrice}',
                                            businessDescription: state.listings[index].description.toString(),
                                            businessLocation: state.listings[index].city.toString(),
                                            businessTitle: state.listings[index].title.toString(),
                                            businessImageUrl: state.listings[index].images.first.toString(),
                                            onTap: () {
                                              context.router.push(SingleListingRoute(listingId: state.listings[index].listingId, industry: state.listings[index].industry));
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  : const Center(child: SizedBox(child: Text('No similar businesses found', textAlign: TextAlign.center)));
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
                ),
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
    );
  }

  Future<dynamic> deleteListingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Delete this listing'),
          content: const Text('Are you sure you want to delete this listing?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('No'),
              onPressed: () {
                context.router.pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Yes'),
              onPressed: () {
                context.router.pop();
                _singleListingBloc.add(DeleteSingleListing(listingId: widget.listingId));
              },
            ),
          ],
        );
      },
    );
  }
}

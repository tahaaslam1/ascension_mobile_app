import 'package:ascension_mobile_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/buyer_home_screen/local_widgets/bottom_loader.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../business_logic/blocs/listing/get_listing_bloc/get_listing_bloc.dart';
import '../../../../logger.dart';
import '../../../widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/services/extension_methods.dart';

class BuyerHomeScreen extends StatefulWidget {
  static const String route = 'buyer-home-screen';
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) context.read<GetListingBloc>().add(ListingFetched());
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "Hey, ",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Text(
                              "${BlocProvider.of<AuthBloc>(context).state.user.firstName}!".toTitleCase(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 24.0, top: 16),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 32,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Let's start exploring",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Businesses Available For Auction:",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: BusinessTileWidget(
                        askingPrice: '50000',
                        businessDescription: 'This is a 3.9K Per Month Amazon FBA Site in the Children Niche which deal with glorious profits',
                        businessLocation: 'Karachi,Pakistan',
                        businessTitle: 'Business Title',
                        businessImageUrl: 'https://www.exeter.ac.uk/media/universityofexeter/campusservices/cafes-shops/responsiveimages/INTO_Avon_Shop_scroller_interior.jpg',
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Explore Other Businesses:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<GetListingBloc, GetListingState>(
                // bloc: _listingBloc,
                builder: (context, state) {
                  switch (state.status) {
                    case GetListingStatus.failure:
                      return const Center(child: Text('Failed to Fetch Listings'));

                    case GetListingStatus.success:
                      if (state.listings.isEmpty) {
                        return const Center(child: Text('No Listings '));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.hasReachedMax ? state.listings.length : state.listings.length + 1,
                        // controller: _scrollController,
                        itemBuilder: (context, index) {
                          return index >= state.listings.length
                              ? const BottomLoader()
                              : BusinessTileWidget(
                                  askingPrice: '${state.listings[index].askingPrice}',
                                  businessDescription: state.listings[index].description.toString(),
                                  businessLocation: state.listings[index].city.toString(),
                                  businessTitle: state.listings[index].title.toString(),
                                  businessImageUrl: state.listings[index].imageUrl.toString(),
                                  onTap: () {
                                    context.router.push(SingleListingRoute(
                                      listingId: state.listings[index].listingId,
                                      industry: state.listings[index].industry,
                                    ));
                                  },
                                );
                        },
                      );
                    case GetListingStatus.initial:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../business_logic/blocs/listing/get_listing_bloc/get_listing_bloc.dart';
import '../../../../logger.dart';
import '../../../widgets/business_tile_widget.dart';

class BuyerHomePageScreen extends StatefulWidget {
  static const String route = 'buyer-homepage-screen';
  const BuyerHomePageScreen({super.key});

  @override
  State<BuyerHomePageScreen> createState() => _BuyerHomePageScreenState();
}

class _BuyerHomePageScreenState extends State<BuyerHomePageScreen> {
  late GetListingBloc _listingBloc;
  var offset = 0;
  @override
  void initState() {
    _listingBloc = BlocProvider.of<GetListingBloc>(context);
    _listingBloc.add(FetchLisiting(offset: offset));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
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
                            "Hunain!",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 8),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.favorite,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSecondaryContainer,
                              borderRadius: BorderRadius.circular(25),
                            ),
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
                // Container(
                //   height: 100.0,
                //   width: 340.0,
                //   child: TextField(
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //       fillColor: Colors.white,
                //       filled: true,
                //       enabledBorder: const OutlineInputBorder(
                //         //  borderRadius: BorderRadius.circular(30.0),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       labelText: 'Search Businesses',
                //       labelStyle: const TextStyle(
                //         fontSize: 18.0,
                //         color: Colors.grey,
                //       ),
                //       suffixIcon: IconButton(
                //         icon: const Icon(Icons.search),
                //         onPressed: () {
                //           // builder profile
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 18,
                // ),
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
              bloc: _listingBloc,
              builder: (context, state) {
                if (state is GetListingLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetListingLoadedState) {
                  return LazyLoadScrollView(
                    onEndOfPage: () => {logger.wtf("aasdasdadsa"), _listingBloc.add(FetchLisiting(offset: offset + 4))},
                    scrollOffset: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.listings.length,
                      itemBuilder: (context, index) {
                        return BusinessTileWidget(
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
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Somthing went wrong'),
                  );
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}

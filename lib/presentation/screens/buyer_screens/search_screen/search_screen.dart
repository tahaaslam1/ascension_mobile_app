import 'package:ascension_mobile_app/presentation/screens/buyer_screens/filter_screen/filter_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/search_bar.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/listing/single_listing_bloc/single_listing_bloc.dart';
import '../../../../business_logic/blocs/searching/searching_bloc.dart';
import '../../../../routes/router.gr.dart';

class SearchScreen extends StatefulWidget {
  static const String route = 'search-screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchingBloc _searchingBloc;
  late SingleListingBloc _singleListingBloc;
  late String listingTitle;

  @override
  void initState() {
    _searchingBloc = BlocProvider.of<SearchingBloc>(context);
    _singleListingBloc = BlocProvider.of<SingleListingBloc>(context);
    // _searchingBloc.add( FetchSearchedListing(listingTitle: listingTitle));
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<SearchingBloc, SearchingState>(builder: (context, state) {
      if (state.getSearchingStatus == GetSearchingStatus.error) {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: Text('Something went wrong'),
            ),
          ),
        );
      } else {
        return Scaffold(
          body: CustomAppBarAndBody(
            showBackButton: false,
            title: 'Search',
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(searchBloc: _searchingBloc),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(FilterRoute());
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.filter_alt, size: 18),
                            Text("Filter"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text("Your Search Results:", style: Theme.of(context).textTheme.headline6),
                ),
                (state.getSearchingStatus == GetSearchingStatus.loading)
                    ? const SizedBox(
                        height: 50.0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : state.listings.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(height: 200),
                              Center(
                                child: Text('No listing found'),
                              ),
                            ],
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: state.listings.length,
                              itemBuilder: (BuildContext context, int index) {
                                return BusinessTileWidget(
                                  askingPrice: '${state.listings[index].askingPrice}',
                                  businessDescription: state.listings[index].description.toString(),
                                  businessLocation: state.listings[index].city.toString(),
                                  businessTitle: state.listings[index].title.toString(),
                                  businessImageUrl: state.listings[index].images.first.toString(),
                                  onTap: () {
                                    context.router.push(SingleListingRoute(
                                      listingId: state.listings[index].listingId,
                                      industry: state.listings[index].industry,
                                    ));
                                  },
                                );
                              },
                            ),
                          ),
              ],
            ),
          ),
        );
      }
    });
  }
}

import 'package:ascension_mobile_app/presentation/screens/buyer_screens/filter_screen/filter_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/local_widgets/search_bar.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatelessWidget {
  static const String route = 'search-screen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
          showBackButton: false,
          title: 'Search',
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchBar(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
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
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text("Your Search Results:", style: Theme.of(context).textTheme.headline6),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const BusinessTileWidget(
                      askingPrice: "123123",
                      businessDescription: "businessDescription",
                      businessLocation: "businessLocation",
                      businessTitle: "businessTitle",
                      businessImageUrl: "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

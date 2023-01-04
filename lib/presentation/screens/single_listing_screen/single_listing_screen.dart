import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'local_widgets/listing_detail_widget.dart';
import 'local_widgets/listing_price_detail_widget.dart';

class SingleListingScreen extends StatelessWidget {
  static const route = 'single-lising-screen';
  SingleListingScreen({super.key});
  final List<String> imageList = [
    "images/hall1.jpg",
    "images/hall4.jpg",
    "images/hall3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomAppBarAndBody(
          title: "Title Of the business",
          showBackButton: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 15,
                      ),
                      Text(
                        "Location of business",
                        style: Theme.of(context).textTheme.subtitle1,
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
                Center(
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
                ),
                const SizedBox(
                  height: 30,
                ),
                const ListingPriceDetails(
                    title: "Asking Price", info: "500000"),
                const ListingPriceDetails(
                    title: "Gross Revenue", info: "3000000"),
                const ListingPriceDetails(
                    title: "EBITDA", info: "Taha chutiya"),
                const ListingPriceDetails(
                    title: "FF&E", info: "Taha phirse chtutiya"),
                const ListingPriceDetails(title: "Established", info: "1947"),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary)),
                        child: TextButton(
                          child: const Text(
                            "Add To Favorite",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary)),
                        child: TextButton(
                          child: const Text(
                            "Chat",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       // Container(
                //       //   height: 50,
                //       //   width: 200,
                //       //   decoration: BoxDecoration(
                //       //       border: Border.all(color: Colors.grey)),
                //       //   child: TextButton(
                //       //     child: Text(
                //       //       "Save",
                //       //       style: TextStyle(
                //       //           fontSize: 20, fontWeight: FontWeight.w200),
                //       //     ),
                //       //     onPressed: (() {}),
                //       //   ),
                //       // ),
                //   //   ],
                //   // ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("BUSINESS DESCRIPTION:",
                      style: Theme.of(context).textTheme.headline5),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Fully Licensed & Operational Craft LA Grow For Sale. This is Downtown LA indoor craft farming at its finest. Fully built out and priced to move! Perfect size to support one to two retail stores, or to start a craft cannabis brand.",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                ),
                const ListingDetail(
                  title: "Detailed Information",
                  info: "Info",
                ),
                const ListingDetail(
                  title: "Staff",
                  info: "3",
                ),
                const ListingDetail(
                  title: "Facilities",
                  info: "falcilities..",
                ),
                const ListingDetail(
                  title: "Reason For Selling",
                  info: "reason...",
                ),
                const ListingDetail(
                  title: "Business-Website",
                  info: "www.chutiya.com",
                ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text(
                //       "SIMILAR BUSINESSES:",
                //       style: Theme.of(context).textTheme.headline5,
                //     ),
                //   ),
                //   SizedBox(
                //     height: 200.0,
                //     child: ListView.builder(
                //       itemCount: 7,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (BuildContext context, int index) {
                //         return BusinessTileWidget(
                //           businessDescription: "this is my business",
                //           businessLocation: "Karachi, Pakistan",
                //           businessTitle: "Pump Jacka Data Works",
                //           askingPrice: " 5000000",
                //           businessImageUrl:
                //               "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                //         );
                //       },
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: SizedBox(
      //   height: 100,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       // Add your onPressed code here!
      //     },
      //     backgroundColor: Theme.of(context).colorScheme.primary,
      //     child: Icon(
      //       Icons.edit,
      //       color: Theme.of(context).colorScheme.onPrimary,
      //     ),
      //   ),
      // ),
    );
  }
}

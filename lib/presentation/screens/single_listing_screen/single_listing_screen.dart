import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ViewSingleListing extends StatelessWidget {
  ViewSingleListing({super.key});
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
          showBackButton: false,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Icon(
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
                SizedBox(
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
                                Container(
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                                    fit: BoxFit.fill,
                                  ),
                                  height: 140,
                                  width: 168,
                                  // color: Colors.grey,
                                ),
                              ],
                            )))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "View Bids",
                      ),
                      style: Theme.of(context).elevatedButtonTheme.style,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Asking Price:",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        "RS. 5000000:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gross Revenue:",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const Text(
                        "RS. 30000:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EBITDA:",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        "Taha chutiya",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FF&E:",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        "Taha phirse chutiya",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Established:",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        "1992",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: TextButton(
                          child: const Text(
                            "Share",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: TextButton(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                          onPressed: (() {}),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("BUSINESS DESCRIPTION:",
                      style: Theme.of(context).textTheme.headline5),
                ),
                SizedBox(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("DETAILED INFORMATION:",
                      style: Theme.of(context).textTheme.headline5),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Info.....",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "STAFF:",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "3",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "FACILITIES:",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Facilities.....",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "REASON FOR SELLING:",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Info.....",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "BUSINESS WEBSITE:",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "www.chutiya.com",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SIMILAR BUSINESSES:",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return BusinessTileWidget(
                        businessDescription: "this is my business",
                        businessLocation: "Karachi, Pakistan",
                        businessTitle: "Pump Jacka Data Works",
                        askingPrice: " 5000000",
                        businessImageUrl:
                            "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/avatar.dart';
import '../../widgets/business_tile_widget.dart';

class BuyerHomePageScreen extends StatelessWidget {
  static const String route = 'buyer-homepage-screen';
  const BuyerHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
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
                        businessDescription:
                            'This isadsasdasdasdasdasdasasdjdghasdgasdasgdgasdasdasdasdasdasdasdasdasdasd a dasdasdasdasdasddaasdasdasdasjdhaskdhasjkdhkajsdhkashdjaescription',
                        businessLocation: 'Karachi,Pakistan',
                        businessTitle: 'Business Title',
                        businessImageUrl:
                            'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
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
            SliverList(
              delegate: SliverChildListDelegate(
                const [
                  BusinessTileWidget(
                    askingPrice: '50000',
                    businessDescription:
                        'This isadsasdasdasdasdasdasasdjdghasdgasdasgdgasdasdasdasdasdasdasdasdasdasd a dasdasdasdasdasddaasdasdasdasjdhaskdhasjkdhkajsdhkashdjaescription',
                    businessLocation: 'Karachi,Pakistan',
                    businessTitle: 'Business Title',
                    businessImageUrl:
                        'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  ),
                  BusinessTileWidget(
                    askingPrice: '50000',
                    businessDescription:
                        'This isadsasdasdasdasdasdasasdjdghasdgasdasgdgasdasdasdasdasdasdasdasdasdasd a dasdasdasdasdasddaasdasdasdasjdhaskdhasjkdhkajsdhkashdjaescription',
                    businessLocation: 'Karachi,Pakistan',
                    businessTitle: 'Business Title',
                    businessImageUrl:
                        'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  ),
                  BusinessTileWidget(
                    askingPrice: '50000',
                    businessDescription:
                        'This isadsasdasdasdasdasdasasdjdghasdgasdasgdgasdasdasdasdasdasdasdasdasdasd a dasdasdasdasdasddaasdasdasdasjdhaskdhasjkdhkajsdhkashdjaescription',
                    businessLocation: 'Karachi,Pakistan',
                    businessTitle: 'Business Title',
                    businessImageUrl:
                        'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  ),
                  BusinessTileWidget(
                    askingPrice: '50000',
                    businessDescription:
                        'This isadsasdasdasdasdasdasasdjdghasdgasdasgdgasdasdasdasdasdasdasdasdasdasd a dasdasdasdasdasddaasdasdasdasjdhaskdhasjkdhkajsdhkashdjaescription',
                    businessLocation: 'Karachi,Pakistan',
                    businessTitle: 'Business Title',
                    businessImageUrl:
                        'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

   
  


// class BusinessTileWidget extends StatelessWidget {
//   const BusinessTileWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 155,
//         decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFF234F68)),
//             borderRadius: BorderRadius.circular(15)),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Image.network(
//                   "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
//                   fit: BoxFit.fill,
//                 ),
//                 height: 140,
//                 width: 168,
//                 // color: Colors.grey,
//               ),
//             ),
//             Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.person,
//                           ),
//                           const Text(
//                             'PumpJack Data Works',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         const Icon(
//                           Icons.location_on,
//                           size: 12,
//                         ),
//                         const Text(
//                           'Shadman Town 14/A',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w100,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Row(
//                         children: const [
//                           Text(
//                             "Descriptionk i wiewef",
//                             style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w100,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //  SizedBox(height: 30, width: 40),
//                   ],
//                 ),
//                 Text(
//                   "Rs 500000",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

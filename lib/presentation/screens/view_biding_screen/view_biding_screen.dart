import 'package:auto_route/auto_route.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../widgets/custom_app_bar_and_body.dart';
import '../../widgets/custom_dotted_border.dart';
import '../../widgets/custom_extended_card.dart';
import 'local_widget/bid_tile_widget.dart';

class ViewBidingScreen extends StatefulWidget {
  static const String route = 'view-biding-screen';
  // final int jobId;

  const ViewBidingScreen({Key? key}) : super(key: key);

  @override
  State<ViewBidingScreen> createState() => _ViewBidingScreenState();
}

class _ViewBidingScreenState extends State<ViewBidingScreen> {
  // late GetSingleJobBloc _getSingleJobBloc;

  @override
  // void initState() {
  //   _getSingleJobBloc = BlocProvider.of<GetSingleJobBloc>(context);
  //   _getSingleJobBloc.add(FetchSingleJob(jobId: widget.jobId));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        title: 'LISTING NAME:',
        showBackButton: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomDottedBorder(
                      borderType: BorderType.RRect,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: GestureDetector(
                          // onTap: () {
                          //   context.router.push(JobFormFlowRoute(isEdit: false));
                          // },
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 28, bottom: 22.82),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Iconify(
                                    Mdi.briefcase_edit_outline,
                                    size: 56,
                                    color: Color(0xFF0061FE),
                                  ),
                                  const SizedBox(height: 9.8),
                                  Text(
                                    'Edit Listing',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: AvatarGlow(
                      glowColor: Theme.of(context).colorScheme.primary,
                      endRadius: 90.0,
                      duration: const Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 9),
              Text(
                'Bids On Your Lisitng',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 9),
              GridView(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 20,
                ),
                children: const [
                  SingleJobCard(
                    newMessage: true,
                  ),
                  SingleJobCard(
                    newMessage: true,
                  ),
                  SingleJobCard(
                    newMessage: true,
                  ),
                  SingleJobCard(
                    newMessage: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}









// import 'package:ascension_mobile_app/presentation/widgets/pulsating_button.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'local_widget/bid_tile_widget.dart';

// class ViewBidingScreen extends StatelessWidget {
//   static const route = 'view-biding-screen';
//   const ViewBidingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text("Bids on Title", // yahan business title aye ga
//                     style: Theme.of(context).textTheme.headline3),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: ListView.builder(
//                   itemCount: 7,
//                   shrinkWrap: true,
//                   itemBuilder: (BuildContext context, int index) {
//                     return BidTile(
//                       name: "Hunain Arif",
//                       dateTime: "Nov 15, 2021 at 7:00",
//                       image:
//                           "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
//                       connect: "2.47ETH",
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

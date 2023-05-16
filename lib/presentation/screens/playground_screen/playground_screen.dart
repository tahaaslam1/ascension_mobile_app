import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PlaygroundScreen extends StatelessWidget {
  static const String route = 'playground';

  const PlaygroundScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {
                context.router.push(BuyerOnboardingFormFlowRoute());
              },
              child: const Text('Buyer Form Flow Screens....'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(BuyerHomeRoute());
              },
              child: const Text('Go to Buyer homepage'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(FavouriteListingRoute());
              },
              child: const Text('Go to Favourite Listing Screen'),
            ),
            // TextButton(
            //   onPressed: () {
            //     context.router.push(SingleListingRoute());
            //   },
            //   child: const Text('Go to Single Listing Screen'),
            // ),
            TextButton(
              onPressed: () {
                context.router.push(PlacingBidRoute());
              },
              child: const Text('Go to Placing Bid Screen'),
            ),
            TextButton(
              onPressed: () {
                // context.router.push(const MileStoneRoute());
              },
              child: const Text('Go to Milestone Screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(const ProfileRouter());
              },
              child: const Text('Go to Profile Screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(FilterRoute());
              },
              child: const Text('Go to Filter-screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(SearchRoute());
              },
              child: const Text('Go to search-screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(EditSingleListingRoute());
              },
              child: const Text('Go to Edit Single Listing Screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(const ViewBidingRoute());
              },
              child: const Text('Go to View Biding Screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(EmailVerificationRoute(email: "tahaaslam046@gmail.com"));
              },
              child: const Text('Go to Email-verification-screen'),
            ),
            TextButton(
              onPressed: () async {
                // NodeListingRepository check = NodeListingRepository(httpClient: HTTPClient(Dio()));

                // await check.getSingleListing(listingId: '994b9af0-05d7-49a9-a71a-6396a6128080');
                // final channel = WebSocketChannel.connect(
                //   Uri.parse('ws://192.168.18.58:3000/v1/connection/?receiver_id=f577fa50-8ac3-11ed-894e-8d97469d78b0&sender_id=0894dc70-8ac4-11ed-894e-8d97469d78b0'),
                // );
                // Future.delayed(const Duration(seconds: 10), () {
                //   channel.sink.close();
                // });
              },
              child: const Text('test websocket'),
            ),
          ],
        ),
      ),
    );
  }
}

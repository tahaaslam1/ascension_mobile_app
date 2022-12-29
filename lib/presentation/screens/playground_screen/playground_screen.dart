import 'package:ascension_mobile_app/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/home_screen/home_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/login_screen/login_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/messages_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/single_listing_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../edit_single_listing_screen/edit_single_lisitng_screen.dart';

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
                context.router.push(ViewBidingRoute());
              },
              child: const Text('Go to View Biding Screen'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(BuyerHomePageRoute());
              },
              child: const Text('Go to Buyer homepage'),
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
          ],
        ),
      ),
    );
  }
}

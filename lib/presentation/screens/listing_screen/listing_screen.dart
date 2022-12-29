import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';

import '../../widgets/custom_dotted_border.dart';

class ListingScreen extends StatelessWidget {
  static const route = 'listing-screen';
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomAppBarAndBody(
          title: 'Businesses',
          showBackButton: false,
          body: SingleChildScrollView(
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      logger.d('hello i');
                      context.router.push(ListingFormFlowRoute());
                    },
                    child: CustomDottedBorder(
                      borderType: BorderType.RRect,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 28, bottom: 22.82),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Iconify(
                                  Mdi.plus_circle_outline,
                                  size: 56,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 9.8),
                                Text(
                                  'Create a Listing',
                                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).colorScheme.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const BusinessTileWidget(
                      askingPrice: '50000',
                      businessDescription: 'This isadsasdasdasdasdasdasasdjdghasdgasdasgdgasdasdasdasdasdasdasdasdasdasd a dasdasdasdasdasddaasdasdasdasjdhaskdhasjkdhkajsdhkashdjaescription',
                      businessLocation: 'Karachi,Pakistan',
                      businessTitle: 'Business Title',
                      businessImageUrl: 'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

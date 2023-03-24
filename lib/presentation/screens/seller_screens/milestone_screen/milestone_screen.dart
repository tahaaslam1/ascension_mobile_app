import 'package:ascension_mobile_app/presentation/screens/seller_screens/milestone_screen/craete_milestone_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_dotted_border.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'local_widget/milestone_card.dart';

class MileStoneScreen extends StatelessWidget {
  static const String route = 'milestone-screen';

  const MileStoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      body: CustomAppBarAndBody(
        showBackButton: true,
        title: 'MileStones',
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateMileStoneScreen()),
                  );
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
                              'Add A New MileStone',
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
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListingFieldTitleWithInfo(
                            title: "Mile Stones With Taha"),
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return MileStoneCard(
                            MileStoneName: "Mile Stone Name",
                            listingName: "Listing Name",
                            startingDate: "01/01/12",
                            endingDate: "10/01/12",
                            daysLeft: "10 days left",
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

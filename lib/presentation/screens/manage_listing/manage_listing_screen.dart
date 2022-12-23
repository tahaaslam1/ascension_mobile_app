import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';

import '../../widgets/custom_dotted_border.dart';

class ManageListing extends StatelessWidget {
  const ManageListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomAppBarAndBody(
        title: 'Businesses',
        showBackButton: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    //   context.router.push(JobFormFlowRoute(isEdit: false));
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
                          padding:
                              const EdgeInsets.only(top: 28, bottom: 22.82),
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
              ListView(
                shrinkWrap: true,
                children: const [
                  BusinessTileWidget(
                    askingPrice: "324234",
                    businessDescription: "asdasfagasfasf",
                    businessImageUrl:
                        "https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru-824x490.jpg",
                    businessLocation: "karachi",
                    businessTitle: "PJD",
                  ),
                  BusinessTileWidget(
                    askingPrice: "324234",
                    businessDescription: "asdasfagasfasf",
                    businessImageUrl:
                        "https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru-824x490.jpg",
                    businessLocation: "karachi",
                    businessTitle: "PJD",
                  ),
                  BusinessTileWidget(
                    askingPrice: "324234",
                    businessDescription: "asdasfagasfasf",
                    businessImageUrl:
                        "https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru-824x490.jpg",
                    businessLocation: "karachi",
                    businessTitle: "PJD",
                  ),
                  BusinessTileWidget(
                    askingPrice: "324234",
                    businessDescription: "asdasfagasfasf",
                    businessImageUrl:
                        "https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru-824x490.jpg",
                    businessLocation: "karachi",
                    businessTitle: "PJD",
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

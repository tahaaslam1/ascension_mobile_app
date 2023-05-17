import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_dotted_border.dart';
import 'package:ascension_mobile_app/presentation/widgets/listing_form_field_title_with_info.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:ascension_mobile_app/services/extension_methods.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import '../../../../business_logic/blocs/milestone/bloc/milestone_bloc.dart';
import 'local_widget/milestone_card.dart';

class MileStoneScreen extends StatefulWidget {
  final String buyerId;
  final String sellerId;
  final String buyerName;
  final String listingTitle;
  final String listingId;

  static const String route = 'milestone-screen';

  const MileStoneScreen({super.key, required this.buyerId, required this.sellerId, required this.buyerName, required this.listingTitle, required this.listingId});

  @override
  State<MileStoneScreen> createState() => _MileStoneScreenState();
}

class _MileStoneScreenState extends State<MileStoneScreen> {
  late MilestoneBloc _milestonebloc;

  @override
  void initState() {
    _milestonebloc = BlocProvider.of<MilestoneBloc>(context);
    _milestonebloc.add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomAppBarAndBody(
        showBackButton: true,
        title: 'MileStones',
        body: RefreshIndicator(
          onRefresh: () {
            _milestonebloc.add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
            return Future.value();
          },
          child: SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.push(
                        CreateMileStoneRoute(buyerId: widget.buyerId, sellerId: widget.sellerId, buyerName: widget.buyerName, listingTitle: widget.listingTitle, listingId: widget.listingId),
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
                                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).colorScheme.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<MilestoneBloc, MilestoneState>(
                    bloc: _milestonebloc,
                    builder: (context, state) {
                      if (state.getMileStoneStatus == CreateMileStoneStatus.loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state.getMileStoneStatus == CreateMileStoneStatus.error) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: const Center(
                            child: Text('Something went wrong'),
                          ),
                        );
                      } else if (state.getMileStoneStatus == CreateMileStoneStatus.loaded) {
                        return state.milestone.isEmpty
                            ? SizedBox(height: MediaQuery.of(context).size.height / 1.5, child: const Center(child: Text("No Milestones added for this buyer yet")))
                            : Column(
                                children: [
                                  const SizedBox(height: 20.0),
                                  ListingFieldTitleWithInfo(
                                    title: "Mile Stones With ${state.milestone.first.buyerName.toTitleCase()}",
                                  ),
                                  ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: state.milestone.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return MileStoneCard(
                                        buyerId: widget.buyerId,
                                        sellerId: widget.sellerId,
                                        listingId: widget.listingId,
                                        isCompleted: state.milestone[index].isCompleted,
                                        mileStoneId: state.milestone[index].milestoneId,
                                        mileStoneName: state.milestone[index].milestoneTitle,
                                        listingName: widget.listingTitle,
                                        startingDate: state.milestone[index].startDate,
                                        endingDate: state.milestone[index].endDate,
                                        daysLeft: state.milestone[index].daysLeft,
                                      );
                                    },
                                  ),
                                ],
                              );
                      } else {
                        return const Text("Something went wrong");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

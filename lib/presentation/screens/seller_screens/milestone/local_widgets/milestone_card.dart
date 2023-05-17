import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/milestone/milestone_bloc.dart';
import '../../../../../services/snack_bar_service.dart';

class MileStoneCard extends StatelessWidget {
  final String listingName;
  final DateTime startingDate;
  final DateTime endingDate;
  final String daysLeft;
  final String mileStoneName;
  final String mileStoneId;
  final String buyerId;
  final String sellerId;
  final String listingId;
  final bool isCompleted;
  const MileStoneCard({
    required this.isCompleted,
    required this.mileStoneId,
    required this.mileStoneName,
    required this.daysLeft,
    required this.endingDate,
    required this.listingName,
    required this.startingDate,
    required this.buyerId,
    required this.sellerId,
    required this.listingId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        elevation: 10.0,
        child: SizedBox(
          height: 250,
          // width: cardWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 3, height: 250, color: Theme.of(context).colorScheme.primary),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                          child: SizedBox(width: MediaQuery.of(context).size.width * 0.2, child: Text(listingName, style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis)),
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(right: 8.0),
                          onPressed: () {
                            context.read<MilestoneBloc>().add(DeleteMilestone(
                                  milestoneId: mileStoneId,
                                  onComplete: () {
                                    SnackBarService.showConfirmationSnackBar(context, "Milestone Deleted Successfully");
                                    context.read<MilestoneBloc>().add(FetchMilestones(buyerId: buyerId, sellerId: sellerId, listingId: listingId));
                                  },
                                  onError: () {
                                    SnackBarService.showGenericErrorSnackBar(context);
                                  },
                                ));
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                      child: Text(mileStoneName, style: Theme.of(context).textTheme.headline6),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                              Text('${startingDate.day} ${startingDate.month} ${startingDate.year}', style: Theme.of(context).textTheme.caption),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text('${endingDate.day} ${endingDate.month} ${endingDate.year}', style: Theme.of(context).textTheme.caption),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.warning, color: Colors.orange, size: 18),
                              (int.tryParse(daysLeft) ?? 0) > 0 ? Text("$daysLeft - Days Left") : const Text("DATE-EXPIRED"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.extension, color: Colors.yellow),
                              GestureDetector(
                                child: const Text("Edit Milestone"),
                                onTap: () {
                                  context.router.push(EditMilestoneRoute(buyerId: buyerId, sellerId: sellerId, milestoneTitle: mileStoneName, milestoneId: mileStoneId, listingId: listingId, endDate: endingDate, startDate: startingDate));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isCompleted == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.done, color: Colors.green),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                  child: const Text("Mark As Completed"),
                                  onTap: () {
                                    context.read<MilestoneBloc>().add(
                                          MarkMilestone(
                                            milestoneId: mileStoneId,
                                            onComplete: () {
                                              context.read<MilestoneBloc>().add(FetchMilestones(buyerId: buyerId, sellerId: sellerId, listingId: listingId));
                                            },
                                            onError: () {
                                              SnackBarService.showGenericErrorSnackBar(context);
                                            },
                                          ),
                                        );
                                    SnackBarService.showSnackBar(context, "Marked Completed ", const Icon(Icons.check));
                                  },
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: const [
                              Text("Completed"),
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              // Container(color: Colors.grey, width: 1, height: 150, margin: const EdgeInsets.only(left: 10.0, right: 10.0)),
            ],
          ),
        ),
      ),
    );
  }
}

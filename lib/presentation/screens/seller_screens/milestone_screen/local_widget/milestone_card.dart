import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/milestone/bloc/milestone_bloc.dart';
import '../../../../../logger.dart';
import '../../../../../services/snack_bar_service.dart';

class MileStoneCard extends StatefulWidget {
  String listingName;
  String startingDate;
  String endingDate;
  String daysLeft;
  String MileStoneName;
  String mileStoneId;
  String buyerId;
  String sellerId;
  String listingId;
  bool is_completed;
  MileStoneCard({
    required this.is_completed,
    required this.mileStoneId,
    required this.MileStoneName,
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
  State<MileStoneCard> createState() => _MileStoneCardState();
}

class _MileStoneCardState extends State<MileStoneCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        child: Container(
          height: 150,
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 3, height: 150, color: Theme.of(context).colorScheme.primary),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                        child: Text(widget.listingName, style: Theme.of(context).textTheme.headline5),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<MilestoneBloc>().add(DeleteMilestone(
                              milestoneId: widget.mileStoneId,
                              onComplete: () {
                                context
                                    .read<MilestoneBloc>()
                                    .add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
                                SnackBarService.showSnackBar(context, "Milestone Deleted Successfully ", Icon(Icons.check));
                              }));
                        },
                        icon: Icon(Icons.delete),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                    child: Text(widget.MileStoneName, style: Theme.of(context).textTheme.headline6),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                            Text(widget.startingDate.toString(), style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                          Text(widget.endingDate.toString(), style: Theme.of(context).textTheme.caption),
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
                            Icon(Icons.warning, color: Colors.orange, size: 18),
                            int.parse(widget.daysLeft) > 0 ? Text("${widget.daysLeft} - Days Left") : Text("DATE-EXPIRED"),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.extension, color: Colors.yellow),
                            InkWell(
                              child: Text("Edit Milestone"), onTap:(){
                                context.router.push(EditMilestoneRoute(buyerId: widget.buyerId, sellerId: widget.sellerId, milestoneTitle: widget.MileStoneName, milestoneId: widget.mileStoneId, listingId: widget.listingId, endDate: widget.endingDate, startDate: widget.startingDate));
                              }),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        widget.is_completed == false
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.done, color: Colors.green),
                                  InkWell(
                                      child: Text("Mark As Completed"),
                                      onTap: () {
                                        logger.d(widget.is_completed);
                                        context.read<MilestoneBloc>().add(
                                              MarkMilestone(
                                                  milestoneId: widget.mileStoneId,
                                                  onComplete: () {
                                                    context
                                                        .read<MilestoneBloc>()
                                                        .add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
                                                  }),
                                            );
                                        SnackBarService.showSnackBar(context, "Marked Completed ", Icon(Icons.check));
                                      }),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

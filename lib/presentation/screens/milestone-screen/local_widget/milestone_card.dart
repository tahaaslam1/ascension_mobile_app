import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MileStoneCard extends StatelessWidget {
  String listingName;
  String startingDate;
  String endingDate;
  String daysLeft;
  String MileStoneName;
  MileStoneCard({
    required this.MileStoneName,
    required this.daysLeft,
    required this.endingDate,
    required this.listingName,
    required this.startingDate,
    Key? key,
  }) : super(key: key);

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
              Container(
                  width: 3,
                  height: 150,
                  color: Theme.of(context).colorScheme.primary),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                    child: Text(listingName,
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                    child: Text(MileStoneName,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month,
                                color: Colors.grey, size: 18),
                            Text(startingDate,
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,
                              color: Colors.grey, size: 18),
                          Text(endingDate,
                              style: Theme.of(context).textTheme.caption),
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
                            Text(daysLeft),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.extension, color: Colors.yellow),
                            Text("Extend Date"),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.done, color: Colors.green),
                            Text("Mark As Completed"),
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

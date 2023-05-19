import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../widgets/avatar.dart';
import '../../../widgets/custom_extended_card.dart';

class SingleJobCard extends StatefulWidget {
  final String avatarUrl;
  final String firstName;
  final String lastName;
  final int bidValue;
  final DateTime createdAT;
  final bool newMessage;
  final VoidCallback onTap;
  // final ButtonType buttonType1;

  const SingleJobCard({
    Key? key,
    required this.lastName,
    required this.avatarUrl,
    required this.bidValue,
    required this.firstName,
    required this.createdAT,
    this.newMessage = true,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SingleJobCard> createState() => _SingleJobCardState();
}

class _SingleJobCardState extends State<SingleJobCard> {
  @override
  Widget build(BuildContext context) {
    return CustomExtendedCard(
      upperBoxHeight: 155,
      lowerBoxHeight: 40,
      // buttonType: buttonType1,
      childTopCard: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Avatar(
              radius: 30,
              avatarUrl: widget.avatarUrl,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.firstName + widget.lastName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: const Color(0xFF1D1C1C)),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.createdAT.day.toString() + "=" + widget.createdAT.month.toString() + "-" + widget.createdAT.year.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.overline?.copyWith(color: const Color(0xFF737B7D)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "BID:" + widget.bidValue.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: const Color(0xFF1D1C1C)),
            ),
          ),
        ],
      ),
      childBottomCard: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.newMessage
              ? [
                  Flexible(
                    child: Iconify(
                      Mdi.message_processing,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'MESSAGE',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.overline?.copyWith(color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                ]
              : [
                  Flexible(
                    child: Iconify(
                      Bx.check_double,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'VIEW INBOX',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.overline?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../widgets/pulsating_button.dart';

// class BidTile extends StatelessWidget {
//   String image;
//   String name;
//   String dateTime;
//   String connect;
//   BidTile({
//     required this.image,
//     required this.name,
//     required this.connect,
//     required this.dateTime,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 10.0,
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     width: 70,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(70.0),
//                         child: CachedNetworkImage(
//                           imageUrl: image,
//                           fit: BoxFit.fill,
//                           height: 120,
//                           width: MediaQuery.of(context).size.width * 0.35,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(name, style: Theme.of(context).textTheme.headline6),
//                       Text(dateTime,
//                           style: Theme.of(context).textTheme.caption),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(connect,
//                         style: Theme.of(context).textTheme.headline6),
//                   ),
//                   PulsatingButton(
//                     primaryColor: Theme.of(context).colorScheme.primary,
//                     secondaryColor: Theme.of(context).colorScheme.secondary,
//                     discRadius: 30,
//                     animationRadius: 30,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

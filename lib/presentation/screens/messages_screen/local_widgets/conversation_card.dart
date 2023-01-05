import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:ascension_mobile_app/services/extension_methods.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../models/inbox.dart';
import '../../../../routes/router.gr.dart';

class ConversationCard extends StatelessWidget {
  final Inbox inbox;
  final bool msgTag;

  const ConversationCard({
    Key? key,
    required this.msgTag,
    required this.inbox,
    // required this.buyerName,
    // required this.imageSource,
    // required this.businessMessagedFor,
    // required this.latestMessage,
    // required this.latestMessageTime,
    // required this.unReadMessagesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(ChatRoute(
          recipientId: inbox.recipientId,
          recipientFirstName: inbox.recipientFirstName,
          recipientLastName: inbox.recipientLastName,
          listingTitle: inbox.listingTitle,
        ));
        //   Navigator.push(context, MaterialPageRoute(builder: ((context) => const ChatScreen())));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
          boxShadow: Styles.elevation2,
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Avatar(
              radius: 28,
              avatarUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQicA4b4KLMCWYETPLWMNk7REyoOOQMMB37wrpcg2Iux4QuqM-j', // TODO : change this..
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${inbox.recipientFirstName} ${inbox.recipientLastName}'.toTitleCase(),
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      inbox.listingTitle,
                      style: Theme.of(context).textTheme.overline?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //const Spacer(),
                    Text(
                      inbox.lastMessage,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    inbox.lastMessageTime,
                    style: Theme.of(context).textTheme.caption?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  if (msgTag)
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "10+",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.overline?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

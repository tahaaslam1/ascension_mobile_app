import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';

class ConversationCard extends StatelessWidget {
  final String candidateName;
  final bool msgTag;
  final String imageSource;
  final String jobAppliedFor;
  final String latestMessage;
  final String latestMessageTime;
  const ConversationCard({
    Key? key,
    required this.msgTag,
    required this.candidateName,
    required this.imageSource,
    required this.jobAppliedFor,
    required this.latestMessage,
    required this.latestMessageTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const ChatScreen())));
      },
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          boxShadow: Styles.elevation2,
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Avatar(
              radius: 28,
              avatarUrl: imageSource,
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
                      candidateName,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      jobAppliedFor,
                      style: Theme.of(context).textTheme.overline?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      latestMessage,
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
                    latestMessageTime,
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

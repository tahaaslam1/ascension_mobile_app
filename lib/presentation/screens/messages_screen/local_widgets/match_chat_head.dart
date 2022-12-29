import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MatchChatHead extends StatelessWidget {
  const MatchChatHead({
    Key? key,
    required this.timeleft,
    this.candidateName = "Ahmed Raza",
    this.imageSource = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQicA4b4KLMCWYETPLWMNk7REyoOOQMMB37wrpcg2Iux4QuqM-j",
  }) : super(key: key);

  final double timeleft;
  final String candidateName;
  final String imageSource;

  List<Color> colorRing() {
    if (timeleft < 0.45) {
      return const [
        Color(0xffFFEAEA),
        Color(0xffD53030),
        Color(0xe2D53030),
        Color(0xffFFEAEA),
      ];
    } else if (timeleft < 0.75) {
      return const [
        Color(0xffFFEED4),
        Color(0xffF6990C),
        Color(0xe2F7B249),
        Color(0xffFFEED4),
      ];
    } else {
      return const [
        Color(0xffCCE8F4),
        Color(0xff30a2d5),
        Color(0xe230a2d5),
        Color(0xffCCE8F4),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.router.push(
        //   const ChatRoute(),
        // );

        Navigator.push(context, MaterialPageRoute(builder: ((context) => ChatScreen())));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          width: 48 * 2,
          child: Column(
            children: [
              CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 32,
                lineWidth: 4,
                percent: timeleft,
                rotateLinearGradient: true,
                startAngle: 355.0,
                reverse: true,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                center: Avatar(radius: 24, avatarUrl: imageSource),
                linearGradient: LinearGradient(colors: colorRing()),
              ),
              const SizedBox(height: 4),
              Text(
                candidateName,
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

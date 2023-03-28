import 'package:ascension_mobile_app/models/inbox.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/local_widgets/conversation_card.dart';
import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:ascension_mobile_app/presentation/widgets/business_tile_widget.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SellerHomeScreen extends StatelessWidget {
  static const String route = 'seller-home-screen';

  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 96,
                backgroundColor: Theme.of(context).colorScheme.background,
                title: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          ),
                          Text(
                            'Daniyal',
                            style: Theme.of(context).textTheme.headline5?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: Styles.elevation3,
                        ),
                        child: const Avatar(
                          radius: 30,
                          avatarUrl: 'https://picsum.photos/200',
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 0,
              ),
            ];
          },
          body: SingleChildScrollView(
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active Businesses',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: BusinessTileWidget(
                          askingPrice: '50000',
                          businessDescription: 'This is description',
                          businessLocation: 'Karachi,Pakistan',
                          businessTitle: 'Business Title',
                          businessImageUrl: 'https://i.tribune.com.pk/media/images/1326848-___n-1487147373/1326848-___n-1487147373.jpg',
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unread Messages (3)',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.onBackground),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ConversationCard(
                            msgTag: false,
                            inbox: Inbox(
                              recipientFirstName: 'Taha',
                              recipientLastName: 'Aslam',
                              lastMessage: 'Last Message',
                              lastMessageTime: DateFormat.jm().format(DateTime.now()),
                              listingTitle: 'TItle',
                            ),
                            //   buyerName: 'Taha Aslam',
                            //   imageSource: 'https://picsum.photos/200',
                            //   businessMessagedFor: 'Business Messaged For',
                            //   latestMessage: 'latest message',
                            //   latestMessageTime: '11:30 pm',
                            //   unReadMessagesCount: 10,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.root.push(const PlaygroundRoute());
          },
          child: const Icon(
            Icons.play_arrow_outlined,
          ),
        ),
      ),
    );
  }
}

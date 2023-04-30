import 'dart:core';

import 'package:ascension_mobile_app/presentation/screens/messages_screen/local_widgets/conversation_card.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/local_widgets/search_bar.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/message/inbox_bloc/inbox_bloc.dart';

class MessagesScreen extends StatefulWidget {
  static const String route = 'messages-screen';

  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late InboxBloc _inboxBloc;

  @override
  void initState() {
    _inboxBloc = BlocProvider.of<InboxBloc>(context);
    _inboxBloc.add(FetchInboxes());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomAppBarAndBody(
            title: 'Messages',
            showBackButton: false,
            body: RefreshIndicator(
              onRefresh: () {
                _inboxBloc.add(FetchInboxes());
                return Future.value();
              },
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 16),
                          // SearchBar(),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    BlocBuilder<InboxBloc, InboxState>(
                      bloc: _inboxBloc,
                      builder: (context, state) {
                        if (state is InboxLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is InboxLoadedState) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Conversation (${state.inboxs.length})',
                                  style: Theme.of(context).textTheme.headline6,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                state.inboxs.isNotEmpty
                                    ? ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: state.inboxs.length,
                                        itemBuilder: (context, index) => Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: ConversationCard(
                                            msgTag: false,
                                            inbox: state.inboxs[index],
                                          ),
                                        ),
                                      )
                                    : const Center(
                                        child: Text('No messages in your inbox'),
                                      )
                              ],
                            ),
                          );
                        } else if (state is InboxErrorState) {
                          return Center(
                            child: Text(state.errorMessage),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

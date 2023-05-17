import 'dart:convert';
import 'dart:math';
import 'package:ascension_mobile_app/constants.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/local_widgets/bottom_widget.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/milestone/craete_milestone_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:ascension_mobile_app/services/extension_methods.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

import '../../../business_logic/blocs/auth/auth_bloc.dart';
import '../../../business_logic/blocs/message/chat_bloc/chat_bloc.dart' as chat_bloc;
import '../../../models/user.dart';

String randomString() {
  var random = Random.secure();
  var values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatScreen extends StatefulWidget {
  static const String route = 'chat-screen';
  final String? recipientId;
  final String recipientFirstName;
  final String recipientLastName;
  final String listingTitle;
  final String listingId;

  const ChatScreen({super.key, required this.recipientId, required this.recipientFirstName, required this.recipientLastName, required this.listingTitle, required this.listingId});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  // final _formKey = GlobalKey<FormBuilderState>();
  final _formKey = GlobalKey<FormState>();
  late WebSocketChannel _channel;

  late types.User _user;

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    final userId = RepositoryProvider.of<UserRepository>(context, listen: false).getLoggedInUser?.userId ?? 'N/A';

    _user = types.User(id: userId);

    _channel = WebSocketChannel.connect(
      Uri.parse('$webSocketBaseUrl/connection/?receiver_id=${widget.recipientId}&sender_id=$userId'),
    );

    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
          highlightColor: Colors.transparent,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        toolbarHeight: 92,
        leadingWidth: 50,
        backgroundColor: Theme.of(context).colorScheme.background,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Avatar(
              radius: 32,
              avatarUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQicA4b4KLMCWYETPLWMNk7REyoOOQMMB37wrpcg2Iux4QuqM-j",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.recipientFirstName} ${widget.recipientLastName}".toTitleCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      widget.listingTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.seller
                ? IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      context.router.push(MileStoneRoute(sellerId: _user.id, buyerId: widget.recipientId!, buyerName: '${widget.recipientFirstName} ${widget.recipientLastName}', listingTitle: widget.listingTitle, listingId: widget.listingId));
                    },
                    icon: const Icon(Icons.add),
                  )
                : const SizedBox()
          ],
        ),
      ),
      body: BlocProvider<chat_bloc.ChatBloc>(
        create: (context) => chat_bloc.ChatBloc(
          channel: _channel,
          user: _user,
        ),
        child: SafeArea(
          child: BlocBuilder<chat_bloc.ChatBloc, chat_bloc.ChatState>(
            builder: (context, state) {
              if (state is chat_bloc.ChatLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is chat_bloc.ChatState) {
                logger.i('state emitted');
                return Chat(
                  messages: state.messages,
                  onSendPressed: (p0) {
                    //  BlocProvider.of<chat_bloc.ChatBloc>(context, listen: false).add(
                    //   chat_bloc.SendMessage(message: p0.text, userId: _user.id),
                    // );
                  },
                  user: _user,
                  theme: DefaultChatTheme(primaryColor: Theme.of(context).colorScheme.primary),
                  customBottomWidget: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: BottomWidget(
                        // formKey: _formKey,
                        messageController: messageController,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final value = messageController.text;
                            logger.d(value);
                            //  final value = _formKey.currentState!.fields['message']!.value;
                            // final value = Map<String, dynamic>.of(_formKey.currentState!.value);

                            if (value.isNotEmpty) {
                              final message = types.PartialText(text: value);

                              BlocProvider.of<chat_bloc.ChatBloc>(context, listen: false).add(
                                chat_bloc.SendMessage(message: message.text, userId: _user.id),
                              );
                            }
                          }
                          messageController.clear();
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Somthing went wrong'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

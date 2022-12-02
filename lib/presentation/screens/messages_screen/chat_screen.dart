import 'dart:convert';
import 'dart:math';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/local_widgets/bottom_widget.dart';
import 'package:ascension_mobile_app/presentation/widgets/avatar.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:doxa_mobile_app/presentation/screens/messages_screen/local_widgets/bottom_widget.dart';
// import 'package:doxa_mobile_app/presentation/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

String randomString() {
  var random = Random.secure();
  var values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatScreen extends StatefulWidget {
  static const String route = 'chat-screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
  final _user2 = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666d');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(
    types.PartialText message,
  ) {
    final textMessage = types.TextMessage(
      author: (Random().nextBool() == true) ? _user : _user2,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), //context.router.pop(),
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
                      "Ahmed Raza",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Business Name Buyer Messaged For",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: DefaultChatTheme(primaryColor: Theme.of(context).colorScheme.primary),
          customBottomWidget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BottomWidget(onPressed: _handleSendPressed),
          ),
        ),
      ),
    );
  }
}

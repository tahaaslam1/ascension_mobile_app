import 'dart:async';
import 'dart:convert';

import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketChannel _channel;
  final types.User _user;

  late StreamSubscription<dynamic> _messagesSubsription;

  ChatBloc({
    required WebSocketChannel channel,
    required types.User user,
  })  : _channel = channel,
        _user = user,
        super(const ChatLoadingState()) {
    on<FetchChats>(_onFetchChats);

    on<SendMessage>(_onSendMessage);

    on<HandleSocketError>(((event, emit) {
      emit(const ChatErrorState(messages: []));
    }));

    _messagesSubsription = _channel.stream.listen(
      (data) => add(FetchChats(data)),
    );
    _messagesSubsription.onError((error) => add(HandleSocketError()));
  }

  @override
  Future<void> close() {
    _messagesSubsription.cancel();
    _channel.sink.close();
    return super.close();
  }

  // _onSocketConnectionError(){

  // }

  void _onFetchChats(
    FetchChats event,
    Emitter<ChatState> emit,
  ) {
    final data = jsonDecode(event.data);

    if (data is List<dynamic>) {
      if (data.isEmpty) {
        emit(ChatState.initial());
      } else {
        List<dynamic> values = List.from(data.reversed);
        List<types.Message> messages = [];

        for (final e in values) {
          final message = types.TextMessage(
            author: types.User(id: e['user_id']),
            id: e['chat_id'],
            text: e['message'],
          );

          messages.insert(values.indexOf(e), message);
        }
        emit(state.copyWith(messages: messages));
      }
    } else {
      List<types.Message> messages = [];

      for (final msg in state.messages) {
        messages.add(msg);
      }

      types.TextMessage msg = types.TextMessage(
        author: types.User(id: data['user_id']),
        id: randomString(),
        text: data['message'],
      );
      messages.insert(0, msg);

      emit(state.copyWith(messages: messages));
    }
  }

  void _onSendMessage(
    SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    final message = {'message': event.message, 'user_id': event.userId};

    _channel.sink.add(json.encode(message));

    List<types.Message> messages = [];

    for (final msg in state.messages) {
      messages.add(msg);
    }

    types.TextMessage msg = types.TextMessage(
      author: types.User(id: event.userId),
      id: randomString(),
      text: event.message,
    );
    messages.insert(0, msg);

    emit(state.copyWith(messages: messages));
  }
}

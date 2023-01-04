part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<types.Message> messages;

  const ChatState({required this.messages});

  factory ChatState.initial() => const ChatState(messages: []);

  ChatState copyWith({
    List<types.Message>? messages,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object> get props => [messages];
}

class ChatLoadingState extends ChatState {
  const ChatLoadingState({super.messages = const []});
}

class ChatErrorState extends ChatState {
  const ChatErrorState({required super.messages});
}

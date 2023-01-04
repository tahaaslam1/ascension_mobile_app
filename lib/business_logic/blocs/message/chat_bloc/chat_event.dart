part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchChats extends ChatEvent {
  const FetchChats(this.data);

  final dynamic data;
}

class SendMessage extends ChatEvent {
  final String message;
  final String userId;

  const SendMessage({required this.message, required this.userId});
}

class HandleSocketError extends ChatEvent {
  
}

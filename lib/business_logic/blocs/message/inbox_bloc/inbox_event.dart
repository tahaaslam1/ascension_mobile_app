part of 'inbox_bloc.dart';

abstract class InboxEvent extends Equatable {
  const InboxEvent();

  @override
  List<Object> get props => [];
}

class FetchInboxes extends InboxEvent {}

class FetchChats extends InboxEvent {}

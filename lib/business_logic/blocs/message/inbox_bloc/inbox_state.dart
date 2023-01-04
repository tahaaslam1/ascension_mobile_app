part of 'inbox_bloc.dart';


abstract class InboxState extends Equatable {
  const InboxState();

  @override
  List<Object> get props => [];
}

class InboxInitial extends InboxState {}

class InboxLoadingState extends InboxState {}

class InboxLoadedState extends InboxState {
  final List<Inbox> inboxs;
  const InboxLoadedState({required this.inboxs});
}

class InboxErrorState extends InboxState {
  final String errorMessage;
  const InboxErrorState({required this.errorMessage});
}

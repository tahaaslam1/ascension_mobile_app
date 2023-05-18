part of 'inbox_bloc.dart';

abstract class InboxEvent extends Equatable {
  const InboxEvent();

  @override
  List<Object> get props => [];
}

class FetchInboxes extends InboxEvent {}

class BuyerCreateInbox extends InboxEvent {
  final String sellerId;
  final String title;
  final String listingId;
  final Function(String firstName, String lastName) inboxCreate;
  final Function(String firstName, String lastName) inboxExits;
  final VoidCallback onError;

  const BuyerCreateInbox({required this.sellerId, required this.title, required this.listingId, required this.inboxCreate, required this.inboxExits, required this.onError});
}

class SellerCreateInbox extends InboxEvent {
  final String buyerId;
  final String title;
  final String listingId;
  final Function(String firstName, String lastName) inboxCreate;
  final Function(String firstName, String lastName) inboxExits;
  final VoidCallback onError;

  const SellerCreateInbox({required this.buyerId, required this.title, required this.listingId, required this.inboxCreate, required this.inboxExits, required this.onError});
}
